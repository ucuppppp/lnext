import React, {useState} from "react";
import {
  FormControl,
  FormLabel,
  Input,
  Button,
  VStack,
  useToast,
  Spinner,
} from "@chakra-ui/react";
import {useFormik} from "formik";
import axiosInstance from "@/lib/axios";

const LoginForm = () => {
  const [loading, setLoading] = useState(false);
  const toast = useToast();

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
        });
        // Reset form after successful login
        formik.resetForm();
      } catch (err) {
        console.log(err);
        toast({
          title: "Login Failed",
          description: err.response?.data?.message || "An error occurred",
          status: "error",
          duration: 4000,
          isClosable: true,
        });
      } finally {
        setLoading(false);
      }
    },
  });

  const handleFormInput = (e) => {
    formik.setFieldValue(e.target.name, e.target.value);
  };

  return (
    <form onSubmit={formik.handleSubmit}>
      <VStack spacing={4}>
        <FormControl>
          <FormLabel>Username</FormLabel>
          <Input
            value={formik.values.username}
            onChange={handleFormInput}
            name="username"
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
        <Button
          type="submit"
          colorScheme="blue"
          isDisabled={loading}
        >
          {loading ? <><p className="mr-2">Logging in</p><br/><Spinner/></>
           : "Login"}{" "}
        </Button>
      </VStack>
    </form>
  );
};

export default LoginForm;
