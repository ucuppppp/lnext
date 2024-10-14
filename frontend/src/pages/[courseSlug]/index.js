// pages/courses/[slug].js
import {useRouter} from "next/router";
import {useQuery} from "@tanstack/react-query";
import CourseDetailEnrolled from "@/components/CourseDetailEnrolled"; // Komponen untuk kursus terdaftar
import CourseDetailNotEnrolled from "@/components/CourseDetailNotEnrolled"; // Komponen untuk kursus belum terdaftar
import {getToken} from "@/lib/functions";
import axiosInstance from "@/lib/axios";
import {useEffect} from "react";
import { Box, Spinner } from "@chakra-ui/react";

// Fungsi untuk memeriksa status pendaftaran
const fetchEnrollment = async (token) => {
  const res = await axiosInstance.get(`/users/progress`, {
    headers: {Authorization: `Bearer ${token}`},
  });
  return res.data?.data?.progress || [];
};

export default function CourseDetail() {
  const router = useRouter();
  const token = getToken();
  const {courseSlug} = router.query; // Ambil slug dari query

  // Redirect ke halaman login jika token tidak ada
  useEffect(() => {
    if (!token) {
      router.push("/login");
    }
  }, [token, router]);

  // Mengambil data pendaftaran
  const {data: enrolled, isError: isEnrollmentError} = useQuery({
    queryKey: ["enrollment"],
    queryFn: () => fetchEnrollment(token),
    enabled: !!token,
  });

  // Menangani kesalahan pada pengambilan data pendaftaran
  if (isEnrollmentError || !enrolled) {
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

  // Cek apakah pengguna terdaftar dalam kursus berdasarkan slug
  const isEnrolled = enrolled.some((item) => item.course.slug === courseSlug);

  // Tampilkan komponen yang sesuai berdasarkan status pendaftaran
  return isEnrolled ? <CourseDetailEnrolled /> : <CourseDetailNotEnrolled />;
}
