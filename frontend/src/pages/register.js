// pages/register.js
import React from "react";
import RegisterForm from "@/components/RegisterForm";
import AuthLayout from "@/components/AuthLayout";

const RegisterPage = () => {
  return (
    <AuthLayout title="Register">
      <RegisterForm />
    </AuthLayout>
  );
};

export default RegisterPage;
