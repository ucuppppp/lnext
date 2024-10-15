import React, {useEffect, useState} from "react";
import {Container, Text, Progress, Spacer, useToast} from "@chakra-ui/react";
import Navbar from "@/components/Navbar";
import Learn from "@/components/Learn";
import Quiz from "@/components/Quiz";
import axiosInstance from "@/lib/axios";
import {useRouter} from "next/router";
import {getToken} from "@/lib/functions";
import { toastPosition } from "@/lib/variables";

const Lesson = () => {
  const toast = useToast();
  const router = useRouter();
  const {courseSlug, lesson_id} = router.query;

  const [order, setOrder] = useState(0); // State untuk mengelola urutan konten
  const [data, setData] = useState(); // State untuk menyimpan data yang diambil
  const [contents, setContents] = useState([]);
  const token = getToken();

  // Fungsi untuk mengambil data berdasarkan courseSlug dan lesson_id
  useEffect(() => {
    if (courseSlug && lesson_id) {
      const fetchContent = async () => {
        try {
          const res = await axiosInstance.get(`/courses/${courseSlug}`, {
            headers: {Authorization: `Bearer ${token}`},
          });
          res.data?.data?.sets?.forEach((set) => {
            set.lessons?.forEach((lesson) => {
              if (parseInt(lesson.id) === parseInt(lesson_id)) {
                setData(lesson);
                setContents(lesson.contents);
              }
            });
          });
        } catch (err) {
          console.log(err);
        }
      };

      fetchContent();
    }
  }, [courseSlug, lesson_id]); // Menambahkan lesson_id sebagai dependensi

  // Fungsi untuk menandai pelajaran sebagai lengkap
  const completingLesson = async () => {
    try {
      const res = await axiosInstance.put(
        `/lessons/${lesson_id}/complete`,
        null,
        {
          headers: {Authorization: `Bearer ${token}`},
        }
      );
      toast({
        title: res.data?.message,
        status: "success",
        duration: 3000,
        isClosable: true,
        position: toastPosition,
      })
      router.push(`/${courseSlug}`);
    } catch (err) {
      console.log(err);
    }
  };

  // Handler untuk pindah ke konten berikutnya
  const handleNext = () => {
    if (order < contents.length - 1) {
      setOrder(order + 1);
    } else {
      completingLesson();
    }
  };

  return (
    <>
      <Navbar />
      <Spacer />
      <Container my={5}>
        <Text fontSize={"2xl"} mb={5}>
          {data?.name || "Loading..."} {/* Menampilkan nama pelajaran */}
        </Text>
        <Progress
          value={contents.length ? (order / contents.length) * 100 : 0} // Menghindari error saat `contents` masih undefined
          mb={10}
          rounded={"full"}
        />
        {/* Menampilkan konten sesuai urutan */}
        {contents?.map((content) => {
          if (content.order === order) {
            if (content.type === "quiz") {
              return (
                <Quiz
                  key={content.id}
                  contentText={content.content}
                  options={content.options}
                  onNext={handleNext}
                  token={token}
                  content_id={content.id}
                />
              );
            } else {
              return (
                <Learn
                  key={content.id}
                  contentText={content.content}
                  onNext={handleNext}
                />
              );
            }
          }
          return null; // Menghindari rendering konten yang tidak cocok dengan urutan saat ini
        })}
        <Spacer my={5} />
      </Container>
    </>
  );
};

export default Lesson;
