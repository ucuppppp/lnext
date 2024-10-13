import React, {useRef, useState, useEffect} from "react";
import {
  FormControl,
  FormLabel,
  Input,
  Button,
  VStack,
  useToast,
  Spinner,
  Text,
} from "@chakra-ui/react";
import {useFormik} from "formik";
import {toastPosition} from "@/lib/variables";
import {setToken, setFullName} from "@/lib/functions";
import Link from "next/link";
import axiosInstance from "@/lib/axios";
import { useRouter } from "next/router";

const LoginForm = () => {
  const [loading, setLoading] = useState(false);
  const toast = useToast();
  const router = useRouter();
  const inputRef = useRef(null);

  const formik = useFormik({
    initialValues: {
      username: "",
      password: "",
    },
    onSubmit: async () => {
      setLoading(true); // Set loading state to true
      try {
        const res = await axiosInstance.post("/login", formik.values);
        console.log(res);
        toast({
          title: res.data.message,
          status: "success",
          duration: 4000,
          isClosable: true,
          position: toastPosition,
        });
        // Reset form after successful login
        formik.resetForm();
        setToken(res.data?.data?.token);
        setFullName(res.data?.data?.full_name);
        router.push("/");
      } catch (err) {
        console.log(err);
        toast({
          title: "Login Failed",
          description: err.response?.data?.message || "An error occurred",
          status: "error",
          duration: 4000,
          isClosable: true,
          position: toastPosition,
        });
      } finally {
        setLoading(false);
      }
    },
  });

  const handleFormInput = (e) => {
    formik.setFieldValue(e.target.name, e.target.value);
  };

  useEffect(() => {
    if(inputRef.current) inputRef.current.focus();
  }, []);

  return (
    <form onSubmit={formik.handleSubmit}>
      <VStack spacing={4}>
        <FormControl>
          <FormLabel>Username</FormLabel>
          <Input
            value={formik.values.username}
            onChange={handleFormInput}
            name="username"
            ref={inputRef}
          />
        </FormControl>
        <FormControl>
          <FormLabel>Password</FormLabel>
          <Input
            value={formik.values.password}
            onChange={handleFormInput}
            name="password"
            type="password"
          />
        </FormControl>
        <Button type="submit" colorScheme="blue" isDisabled={loading}>
          {loading ? (
            <>
              <p className="mr-2">Logging in</p>
              <br />
              <Spinner />
            </>
          ) : (
            "Login"
          )}{" "}
        </Button>
        <Text>
          Don't have an account?{" "}
          <Link href="/register" className="text-blue-400 hover:underline">
            Register
          </Link>
        </Text>
      </VStack>
    </form>
  );
};

export default LoginForm;
