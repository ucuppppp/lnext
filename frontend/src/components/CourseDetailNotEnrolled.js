import Head from "next/head";
import Navbar from "@/components/Navbar";
import {
  Box,
  Button,
  Container,
  Heading,
  Text,
  VStack,
  Stack,
  Spinner,
  useToast,
} from "@chakra-ui/react";
import {useRouter} from "next/router";
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

const fetchUser = async (token) => {
  const res = await axiosInstance.get("/me", {
    headers: {Authorization: `Bearer ${token}`},
  });
  return res.data?.data || {};
};

export default function CourseNotEnrolled() {
  const router = useRouter();
  const {courseSlug} = router.query;
  const token = getToken();
  const toast = useToast();

  // Query to fetch course data
  const {
    data: course,
    isLoading,
    isError,
  } = useQuery({
    queryKey: ["course", courseSlug],
    queryFn: () => fetchCourse(token, courseSlug),
    enabled: !!token && !!courseSlug,
  });

const {
    data: user,
    isLoading: isLoadingUser,
    isError: isErrorUser,
} = useQuery({
    queryKey: ["user"],
    queryFn: () => fetchUser(token),
    enabled: !!token,
  });

  if (isLoading) {
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

  if (isError) {
    return (
      <Box
        minH="100vh"
        display="flex"
        justifyContent="center"
        alignItems="center"
      >
        <Text>An error occurred while loading the course data.</Text>
      </Box>
    );
  }

  const handleCourseRegister = async (token) => {
    console.log(token);
    try{
        const res = await axiosInstance.post(`/courses/${courseSlug}/register`, null,{
            headers: {
                Authorization: `Bearer ${token}`
            },
        });

        toast({
            title: res.data?.message,
            status: "success",
            duration: 3000,
            isClosable: true,
            position: toastPosition,
        })

        setTimeout(() => {  
            router.reload();
        }, 3000);
    } catch (err) {
        console.log(err);
        toast({
            title: "Registration Failed",
            description: err.response?.data?.message || "An error occurred",
            status: "error",
            duration: 4000,
            isClosable: true,
            position: toastPosition,
        })
    }
  };

  return (
    <div className="min-h-screen bg-gray-800">
      <Head>
        <title>{course?.name || "Course Details"}</title>
      </Head>
      {/* Navbar with user fullName */}
      <Navbar fullName={user?.full_name} />{" "}
      {/* Ganti dengan state user sebenarnya */}
      <Container className="py-5 text-white">
        {/* Course Title and Register Button */}
        <div className="flex justify-between items-center mb-4">
          <Heading as="h3" size="lg">
            {course?.name}
          </Heading>
          <Button
            p={7}
            colorScheme="blue"
            onClick={() =>handleCourseRegister(token)} // Ganti dengan rute pendaftaran sebenarnya
          >
            Register to this course
          </Button>
        </div>

        {/* Course Description */}
        <Text className="mb-5">{course?.description}</Text>

        {/* Course Outline */}
        <div className="mb-4">
          <Heading as="h4" size="md" className="mb-3">
            Outline
          </Heading>
            {course?.sets?.map((set, index) => (
              <Box
                key={set.id}
                className="bg-gray-700 p-4 rounded-md shadow-md"
                my={2}
              >
                <Text fontSize="lg" className="mb-0">
                  {index + 1}. {set.name}
                </Text>
              </Box>
            ))}
        </div>
      </Container>
    </div>
  );
}
