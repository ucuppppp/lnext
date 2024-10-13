import Head from "next/head";
import Navbar from "@/components/Navbar";
import { Box, Container, Heading, Spinner, useToast, Text, Progress, Badge, Spacer } from "@chakra-ui/react";
import { useRouter } from "next/router";
import { useQuery } from "@tanstack/react-query";
import axiosInstance from "@/lib/axios";
import { getToken, setToken } from "@/lib/functions";
import { toastPosition } from "@/lib/variables";

// Function to fetch course data
const fetchCourse = async (token, courseSlug) => {
  const res = await axiosInstance.get(`/courses/${courseSlug}`, {
    headers: { Authorization: `Bearer ${token}` },
  });
  return res.data?.data || [];
};

// Function to fetch user progress
const fetchProgress = async (token) => {
  const res = await axiosInstance.get(`/users/progress`, {
    headers: { Authorization: `Bearer ${token}` },
  });
  return res.data?.data || [];
};

// Function to fetch user data
const fetchUser = async (token) => {
  const res = await axiosInstance.get("/me", {
    headers: { Authorization: `Bearer ${token}` },
  });
  return res.data?.data || {};
};

export default function DetailCourse() {
  const router = useRouter();
  const { courseSlug } = router.query;
  const toast = useToast();
  const token = getToken();

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
  const { data: course, isLoading: courseLoading, isError: courseError } = useQuery({
    queryKey: ["course", courseSlug],
    queryFn: () => fetchCourse(token, courseSlug),
    enabled: !!token && !!courseSlug,
    onError: handleSessionExpired,
  });

  // Query to fetch user and progress data in parallel
  const { data: user, isLoading: userLoading, isError: userError } = useQuery({
    queryKey: ["user", token],
    queryFn: () => fetchUser(token),
    enabled: !!token,
    onError: handleSessionExpired,
  });

  const { data: progressData, isLoading: progressLoading, isError: progressError } = useQuery({
    queryKey: ["progress", token],
    queryFn: () => fetchProgress(token),
    enabled: !!token,
    onError: handleSessionExpired,
  });

  if (courseLoading || userLoading || progressLoading) {
    return (
      <Box minH="100vh" display="flex" justifyContent="center" alignItems="center">
        <Spinner size="xl" />
      </Box>
    );
  }

  if (courseError || userError || progressError) {
    return (
      <Box minH="100vh" display="flex" justifyContent="center" alignItems="center">
        <Text>An error occurred while loading the data.</Text>
      </Box>
    );
  }

  // Extract completed lessons from progress data
  const completedLessons = progressData?.progress?.reduce((acc, enrollment) => {
    return [...acc, ...enrollment?.completed_lessons?.map((lesson) => lesson.id)];
  }, []);

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
        <Progress value={80} rounded="md" size="lg" mb={8} colorScheme="teal" />

        {/* Course Sets and Lessons */}
        {course?.sets && course?.sets.length > 0 ? (
          course.sets.map((set) => (
            <Box key={set.id} mb={6}>
              <Text fontWeight="bold" fontSize="xl" mb={2}>
                {set.name}
              </Text>

              {/* Lessons under the set */}
              {set.lessons && set.lessons.length > 0 ? (
                set.lessons.map((lesson) => (
                  <Box
                    key={lesson.id}
                    display="flex"
                    bg="gray.600"
                    p={4}
                    rounded="md"
                    m={2}
                    alignItems="center"
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
                      colorScheme={completedLessons?.includes(lesson.id) ? "blue" : "black"}
                      rounded="md"
                    >
                      {completedLessons?.includes(lesson.id) ? "Completed" : "In Progress"}
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
