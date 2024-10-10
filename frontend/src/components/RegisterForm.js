// // components/RegisterForm.js
// import React, {useState} from "react";
// import {useRegister} from "../hooks/auth";

// const RegisterForm = () => {
//   const [username, setUsername] = useState("");
//   const [password, setPassword] = useState("");
//   const registerMutation = useRegister();
//   const router = useRouter();

//   const handleSubmit = (e) => {
//     e.preventDefault();
//     registerMutation.mutate(
//       {username, password},
//       {
//         onSuccess: () => {
//           router.push("/login"); // Redirect ke login setelah berhasil register
//         },
//         onError: () => {
//           alert("Registration failed");
//         },
//       }
//     );
//   };

//   return (
//     <form onSubmit={handleSubmit}>
//       {registerMutation.isError && (
//         <p className="text-red-500">Registration failed</p>
//       )}
//       <div className="mb-4">
//         <label htmlFor="username" className="block text-gray-700">
//           Username
//         </label>
//         <input
//           id="username"
//           type="text"
//           value={username}
//           onChange={(e) => setUsername(e.target.value)}
//           className="border border-gray-300 p-2 w-full"
//         />
//       </div>
//       <div className="mb-4">
//         <label htmlFor="password" className="block text-gray-700">
//           Password
//         </label>
//         <input
//           id="password"
//           type="password"
//           value={password}
//           onChange={(e) => setPassword(e.target.value)}
//           className="border border-gray-300 p-2 w-full"
//         />
//       </div>
//       <button
//         type="submit"
//         className="w-full bg-blue-500 text-white p-2"
//         disabled={registerMutation.isLoading}
//       >
//         {registerMutation.isLoading ? "Registering..." : "Register"}
//       </button>
//     </form>
//   );
// };

// export default RegisterForm;
