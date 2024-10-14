import {Button, FormControl, Text, Stack} from "@chakra-ui/react";
import {useFormik} from "formik";

const Quiz = ({contentText, options, onNext}) => {
  const formik = useFormik({
    initialValues: {
      option_id: "", // Menyimpan id dari opsi yang dipilih
    },
    onSubmit: (values) => {
      console.log("Selected option ID:", values.option_id); // Menampilkan opsi yang dipilih di console
      onNext(); // Panggil fungsi untuk lanjut ke konten berikutnya
    },
  });

  // Handler untuk memilih opsi
  const handleOptionSelect = (id) => {
    formik.setFieldValue("option_id", id); // Set option_id yang dipilih
  };

  return (
    <>
      <Text my={5}>{contentText}</Text>
      <form onSubmit={formik.handleSubmit}>
        <FormControl>
          <Stack spacing={3}>
            {options.map((option) => (
              <Button
                key={option.id}
                width={"100%"}
                my={2}
                onClick={() => handleOptionSelect(option.id)} // Panggil handler saat opsi diklik
                bg={
                  formik.values.option_id === option.id
                    ? "blue.400"
                    : "gray.200"
                } // Ubah warna jika opsi dipilih
                color={
                  formik.values.option_id === option.id ? "white" : "black"
                }
              >
                {option.option_text}
              </Button>
            ))}
          </Stack>
          <Button
            type="submit" // Tombol untuk mengirimkan jawaban
            bg={"blue.400"}
            color={"white"}
            width={"100%"}
            my={5}
            isDisabled={!formik.values.option_id} // Nonaktifkan tombol "Check" jika belum ada opsi yang dipilih
          >
            Check
          </Button>
        </FormControl>
      </form>
    </>
  );
};

export default Quiz;
