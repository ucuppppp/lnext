import Head from "next/head";
import Navbar from "@/components/Navbar";
import {
  Box,
  Container,
  Heading,
  Spinner,
  useToast,
  Text,
  Progress,
  Badge,
  Spacer,
} from "@chakra-ui/react";
import {useRouter} from "next/router";
import {useEffect, useState} from "react";
import {useQuery} from "@tanstack/react-query";
import axiosInstance from "@/lib/axios";
import {getToken, setToken} from "@/lib/functions";
import {toastPosition} from "@/lib/variables";

// Function to fetch course data
const fetchCourse = async (token, courseSlug) => {
  const res = await axiosInstance.get(`/courses/${courseSlug}`, {
    headers: {Authorization: `Bearer ${token}`},
  });
  return res.data?.data || [];
};

// Function to fetch user progress
const fetchProgress = async (token) => {
  const res = await axiosInstance.get(`/users/progress`, {
    headers: {Authorization: `Bearer ${token}`},
  });
  return res.data?.data || [];
};

// Function to fetch user data
const fetchUser = async (token) => {
  const res = await axiosInstance.get("/me", {
    headers: {Authorization: `Bearer ${token}`},
  });
  return res.data?.data || {};
};

export default function DetailCourse() {
  const router = useRouter();
  const {courseSlug} = router.query;
  const toast = useToast();
  const token = getToken();

  const [isFetching, setIsFetching] = useState(true); // State untuk menandai fetching

  const handleSessionExpired = () => {
    setToken(null);
    toast({
      title: "Your session has expired",
      status: "error",
      duration: 1500,
      isClosable: true,
      position: toastPosition,
    });
    router.push("/login");
  };

  // Query to fetch course data
  const {
    data: course,
    isLoading: courseLoading,
    isError: courseError,
  } = useQuery({
    queryKey: ["course", courseSlug],
    queryFn: () => fetchCourse(token, courseSlug),
    enabled: !!token && !!courseSlug,
    onError: handleSessionExpired,
  });

  // Query to fetch user and progress data in parallel
  const {
    data: user,
    isLoading: userLoading,
    isError: userError,
  } = useQuery({
    queryKey: ["user", token],
    queryFn: () => fetchUser(token),
    enabled: !!token,
    onError: handleSessionExpired,
  });

  const {
    data: progressData,
    isLoading: progressLoading,
    isError: progressError,
  } = useQuery({
    queryKey: ["progress", token],
    queryFn: () => fetchProgress(token),
    enabled: !!token,
    onError: handleSessionExpired,
  });

  // Tambahkan useEffect untuk menangani fetching data
  useEffect(() => {
    if (courseSlug && token) {
      setIsFetching(false); // Data sudah siap untuk dirender
    }
  }, [courseSlug, token]);

  if (isFetching || courseLoading || userLoading || progressLoading) {
    return (
      <Box
        minH="100vh"
        display="flex"
        justifyContent="center"
        alignItems="center"
      >
        <Spinner size="xl" />
      </Box>
    );
  }

  if (courseError || userError || progressError) {
    return (
      <Box
        minH="100vh"
        display="flex"
        justifyContent="center"
        alignItems="center"
      >
        <Text>An error occurred while loading the data.</Text>
      </Box>
    );
  }

  // Mendapatkan semua ID dari pelajaran yang telah diselesaikan yang sesuai dengan course
  // Mendapatkan semua pelajaran dari setiap set dalam course yang sedang dianalisis
  const allLessons = course?.sets?.flatMap(
    (set) => set.lessons.map((lesson) => ({...lesson, setId: set.id})) // Menyertakan setId di setiap lesson
  );

  const completedLessons = progressData?.progress?.reduce(
    (completed, enrollment) => {
      const lessonIds =
        enrollment?.completed_lessons
          ?.filter((lesson) => allLessons?.some((l) => l.id === lesson.id))
          .map((lesson) => lesson.id) || [];
      return [...completed, ...lessonIds];
    },
    []
  );

  // Mengurutkan pelajaran berdasarkan urutan set dan urutan lesson
  const sortedLessons = allLessons?.sort((a, b) => {
    if (a.setId === b.setId) {
      return a.order - b.order; // Mengurutkan berdasarkan order jika setId sama
    }
    return a.setId - b.setId; // Mengurutkan berdasarkan setId
  });

  // Jika Anda ingin menandai lesson 'current', lakukan logika berikut:
  const firstIncompleteLessonIndex = sortedLessons?.findIndex(
    (lesson) => !completedLessons?.includes(lesson.id)
  );

  const lessonStatusesWithCurrent = sortedLessons?.map((lesson, index) => {
    const baseStatus =
      completedLessons?.includes(lesson.id) ||
      index < firstIncompleteLessonIndex
        ? "completed"
        : index === firstIncompleteLessonIndex
        ? "current"
        : "locked"; // Jika bukan 'completed' dan bukan 'current', maka 'locked'

    return {lesson, status: baseStatus};
  });

  // Menghitung nilai progress course
  const totalLessons = allLessons?.length || 0; // Total pelajaran
  const completedLessonsCount = completedLessons?.length || 0; // Jumlah pelajaran yang diselesaikan

  const progressValue =
    totalLessons === 0 ? 0 : (completedLessonsCount / totalLessons) * 100; // Hitung nilai progress

  return (
    <div className="min-h-screen bg-gray-800">
      <Head>
        <title>{course?.name || "Course Detail"}</title>
      </Head>

      {/* Navbar with user fullName */}
      <Navbar fullName={user?.full_name} />

      <Container className="text-white py-8">
        {/* Course Title */}
        <Heading as="h1" size="xl" mb={4}>
          {course?.name}
        </Heading>

        {/* Course Progress */}
        <Progress
          value={progressValue}
          rounded="md"
          size="lg"
          mb={8}
          colorScheme="teal"
        />

        {/* Course Sets and Lessons */}
        {course?.sets && course?.sets.length > 0 ? (
          course.sets.map((set) => (
            <Box key={set.id} mb={6}>
              <Text fontWeight="bold" fontSize="xl" mb={2}>
                {set.name}
              </Text>

              {/* Lessons under the set */}
              {set.lessons && set.lessons.length > 0 ? (
                lessonStatusesWithCurrent
                  .filter((item) =>
                    set.lessons.some((lesson) => lesson.id === item.lesson.id)
                  )
                  .map(({lesson, status}) => (
                    <Box
                      key={lesson.id}
                      display="flex"
                      bg="gray.600"
                      p={4}
                      rounded="md"
                      m={2}
                      alignItems="center"
                      cursor={status === "locked" ? "not-allowed" : "pointer"} // Mengubah kursor jika locked
                      opacity={status === "locked" ? 0.5 : 1} // Mengurangi opacity jika locked
                      onClick={() => {
                        if (status !== "locked") {
                          router.push(`/${courseSlug}/lessons/${lesson.id}`);
                        }
                      }}
                    >
                      <div>
                        <Text fontSize="sm">Lesson</Text>
                        <Text fontWeight="bold" fontSize="lg">
                          {lesson.name}
                        </Text>
                      </div>
                      <Spacer />
                      <Badge
                        border="1px"
                        colorScheme={
                          status === "completed"
                            ? "blue"
                            : status === "current"
                            ? "green"
                            : "black"
                        }
                        rounded="md"
                      >
                        {status === "completed"
                          ? "Completed"
                          : status === "current"
                          ? "Current"
                          : "Locked"}
                      </Badge>
                    </Box>
                  ))
              ) : (
                <Text>No lessons available</Text>
              )}
            </Box>
          ))
        ) : (
          <Text>No course sets available</Text>
        )}
      </Container>
    </div>
  );
}
