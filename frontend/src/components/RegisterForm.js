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
import { toastPosition } from "@/lib/variables";
import {setToken, setFullName} from "@/lib/functions";
import {useFormik} from "formik";
import axiosInstance from "@/lib/axios";
import Link from "next/link"; // Import next/link
import { useRouter } from "next/router";

const RegisterForm = () => {
  const [loading, setLoading] = useState(false);
  const [isMatch, setIsMatch] = useState(true);
  const inputRef = useRef(null);
  const router = useRouter();
  const toast = useToast();

  const formik = useFormik({
    initialValues: {
      fullname: "",
      username: "",
      password: "",
      password2: "",
    },
    onSubmit: async () => {
      if (formik.values.password !== formik.values.password2) {
        setIsMatch(false);
        return;
      }
      setLoading(true); // Set loading state to true
      try {
        const res = await axiosInstance.post("/register", {
          full_name: formik.values.fullname,
          username: formik.values.username,
          password: formik.values.password,
        });
        toast({
          title: res.data.message,
          status: "success",
          duration: 4000,
          isClosable: true,
          position: toastPosition,
        });
        // Reset form after successful Register
        formik.resetForm();
        setToken(res.data?.data?.token);
        setFullName(res.data?.data?.full_name);
        router.push("/");
      } catch (err) {
        console.log(err);
        toast({
          title: "Register Failed",
          description:
            err.response?.data?.errors.password ||
            err.response?.data?.errors.full_name ||
            err.response?.data?.errors.username ||
            err.response?.data?.message ||
            "An error occurred",
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
    if (
      e.target.name === "password2" &&
      formik.values.password === e.target.value
    ) {
      setIsMatch(true);
    }
  };

  useEffect(() => {
    if(inputRef.current) inputRef.current.focus();
  }, []);

  return (
    <form onSubmit={formik.handleSubmit}>
      <VStack spacing={4}>
        <FormControl>
          <FormLabel>Fullname</FormLabel>
          <Input
            required
            value={formik.values.fullname}
            onChange={handleFormInput}
            name="fullname"
            ref={inputRef}
          />
        </FormControl>
        <FormControl>
          <FormLabel>Username</FormLabel>
          <Input
            required
            value={formik.values.username}
            onChange={handleFormInput}
            name="username"
          />
        </FormControl>
        <FormControl>
          <FormLabel>Password</FormLabel>
          <Input
            required
            value={formik.values.password}
            onChange={handleFormInput}
            name="password"
            type="password"
          />
          {!isMatch && (
            <Text className="text-red-500">Passwords must match</Text>
          )}
        </FormControl>
        <FormControl>
          <FormLabel>Confirm Password</FormLabel>
          <Input
            required
            value={formik.values.password2}
            onChange={handleFormInput}
            name="password2"
            type="password"
          />
          {!isMatch && (
            <Text className="text-red-500">Passwords must match</Text>
          )}
        </FormControl>
        <Button type="submit" colorScheme="blue" isDisabled={loading}>
          {loading ? (
            <>
              <Text className="mr-2">Registering</Text>
              <br />
              <Spinner />
            </>
          ) : (
            "Register"
          )}
        </Button>
        <Text>
          Already have an account?{" "}
          <Link
            href="/login"
            className="text-blue-400 hover:underline"
            passHref
          >
            Login {/* Link menggunakan next/link */}
          </Link>
        </Text>
      </VStack>
    </form>
  );
};

export default RegisterForm;
