// pages/login.js
import React from "react";
import LoginForm from "@/components/LoginForm";
import AuthLayout from "@/components/AuthLayout";

const LoginPage = () => {
  return (
    <AuthLayout title="Login">
      <LoginForm />
    </AuthLayout>
  );
};

export default LoginPage;
