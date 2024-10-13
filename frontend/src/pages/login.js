// pages/login.js
import React, { useEffect } from "react";
import LoginForm from "@/components/LoginForm";
import AuthLayout from "@/components/AuthLayout";
import { getToken } from "@/lib/functions";
import { useRouter } from "next/router";

const LoginPage = () => {
  const router = useRouter();
  
  useEffect(() => {
    const token = getToken();
    if(token) {
      router.push("/");
    }
  }, []);

  return (
    <AuthLayout title="Login">
      <LoginForm />
    </AuthLayout>
  );
};

export default LoginPage;
