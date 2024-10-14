// components/AuthLayout.js
import React from "react";

const AuthLayout = ({title, children}) => {
  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-800 text-white">
      <div className="max-w-md w-full space-y-8 border border-gray-700 rounded-lg p-8">
        <h1 className="text-center text-3xl font-extrabold">{title}</h1>
        {children}
      </div>
    </div>
  );
};

export default AuthLayout;
