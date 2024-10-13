import React from "react";
import { Box, Flex, Text, Button, useToast } from "@chakra-ui/react";
import { useRouter } from "next/router";
import { setToken, getToken } from "@/lib/functions";
import axiosInstance from "@/lib/axios";

const Navbar = ({ fullName }) => {
  const router = useRouter();
  const toast = useToast(); // Inisialisasi toast

  const handleLogout = async () => {
    try {
      const token = getToken(); // Dapatkan token dari local storage
      if (!token) {
        throw new Error("No token found");
      }

      await axiosInstance.post(
        "/logout",
        {}, // Kosongkan body request
        {
          headers: {
            Authorization: `Bearer ${token}`, // Sertakan token di headers
          },
        }
      );

      setToken(null); // Hapus token dari local storage
      toast({
        title: "Logout successful!",
        status: "success",
        duration: 3000,
        isClosable: true,
      });
      router.push("/login"); // Redirect ke halaman login
    } catch (err) {
      console.log(err);
      toast({
        title: "Logout failed",
        description: "An error occurred while logging out.",
        status: "error",
        duration: 3000,
        isClosable: true,
      });
    }
  };

  return (
    <Box as="nav" bg="gray.600" padding="1rem">
      <Flex
        justifyContent="space-between"
        alignItems="center"
        maxW="1200px"
        mx="auto"
      >
        <Text fontSize="xl" color="white" fontWeight="bold">
          Web Tech Studio
        </Text>
        <Flex alignItems="center">
          <Text color="white" marginRight="2rem">
            {fullName}
          </Text>
          <Button colorScheme="teal" variant="outline" onClick={handleLogout}>
            Logout
          </Button>
        </Flex>
      </Flex>
    </Box>
  );
};

export default Navbar;
