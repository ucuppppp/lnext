export const setToken = (token) => {
    if (token) {
        localStorage.setItem("token", token);
    } else {
        localStorage.removeItem("token");
    }
}


export const getToken = () => {
    if (typeof window !== "undefined") { // Pastikan ini hanya dijalankan di client-side
      return localStorage.getItem("token");
    }
    return null; // Kembalikan null jika tidak di client-side
  };
  

export const setFullName = (fullName) => {
    if (fullName) {
        localStorage.setItem("fullName", fullName);
    } else {
        localStorage.removeItem("fullName");
    }
}

export const getFullName = () => {
    if (typeof window !== "undefined") { // Pastikan ini hanya dijalankan di client-side
        return localStorage.getItem("fullName");
      }
    return null;
}
