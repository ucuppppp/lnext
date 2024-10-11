// components/Navbar.js
import React from "react";
import {Box, Flex, Text, Button, useToast} from "@chakra-ui/react"; // Tambahkan useToast
import {useRouter} from "next/router";
import {setToken, getToken} from "@/lib/functions"; // Import fungsi setToken dan getToken
import axiosInstance from "@/lib/axios";

const Navbar = ({fullName}) => {
  const router = useRouter();
  const toast = useToast(); // Inisialisasi toast

  const handleLogout = async () => {
    try {
      const res = await axiosInstance.delete("/logout", {
        headers: {
          Authorization: `Bearer ${getToken()}`, // Dapatkan token dari local storage
        },
      });

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
    <Box as="nav" bg="teal.500" padding="1rem">
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
