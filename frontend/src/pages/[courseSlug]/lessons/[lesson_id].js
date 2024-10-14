import React, {useEffect, useState} from "react";
import {Container, Text, Progress, Spacer} from "@chakra-ui/react";
import Navbar from "@/components/Navbar";
import Learn from "@/components/Learn";
import Quiz from "@/components/Quiz";
import axiosInstance from "@/lib/axios";
import {useRouter} from "next/router";
import { getToken } from "@/lib/functions";

const Lesson = () => {
  const router = useRouter();
  const {courseSlug} = router.query;

  const [order, setOrder] = useState(0); // State untuk mengelola urutan konten
  const [data, setData] = useState([]); // State untuk menyimpan data yang diambil
  const [lessonName, setLessonName] = useState(""); // State untuk nama lesson
  const token = getToken();


  // Fungsi untuk mengambil data berdasarkan courseSlug
  useEffect(() => {
    if (courseSlug) {
      const fetchContent = async () => {
        try {
          const res = await axiosInstance.get(`/courses/${courseSlug}`, {
            headers: {Authorization: `Bearer ${token}`},
          });
          res.data?.sets?.forEach(set => {
            setOrder.lessons.foreach(lesson => {
                lesson.content.forEach(content => {
                    
                })
            })
          });
        } catch (err) {
          console.log(err);
        }
      };

      fetchContent();
    }
  }, [courseSlug]); // Effect akan dijalankan setiap kali courseSlug berubah

  // Handler untuk pindah ke konten berikutnya
  const handleNext = () => {
    if (order < data.length - 1) {
      setOrder(order + 1);
    }
  };

  // Handler untuk pindah ke konten sebelumnya (jika perlu)
  const handlePrev = () => {
    if (order > 0) {
      setOrder(order - 1);
    }
  };

  return (
    <>
      <Navbar />
      <Spacer />
      <Container my={5}>
        <Text fontSize={"2xl"} mb={5}>
          {lessonName || "Loading..."} {/* Menampilkan nama lesson */}
        </Text>
        <Progress value={(order / data.length) * 100} mb={10} />

        {data.length > 0 &&
          data.map((item) =>
            item.order === order ? (
              item.type === "learn" ? (
                <Learn
                  key={item.id}
                  contentText={item.content}
                  onNext={handleNext}
                />
              ) : (
                <Quiz
                  key={item.id}
                  contentText={item.content}
                  options={item.options}
                  onNext={handleNext}
                />
              )
            ) : null
          )}
        <Spacer my={5} />
      </Container>
    </>
  );
};

export default Lesson;
