export const setToken = (token) => {
    if (token) {
        localStorage.setItem("token", token);
    } else {
        localStorage.removeItem("token");
    }
}


export const getToken = () => {
    return localStorage.getItem("token");
}

export const setFullName = (fullName) => {
    if (fullName) {
        localStorage.setItem("fullName", fullName);
    } else {
        localStorage.removeItem("fullName");
    }
}

export const getFullName = () => {
    return localStorage.getItem("fullName");
}
