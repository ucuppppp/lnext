import {Button, Text} from "@chakra-ui/react";

const Learn = ({contentText, onNext}) => {
  return (
    <>
      <Text my={5}>{contentText}</Text>
      <Button
        bg={"blue.400"}
        color={"white"}
        width={"100%"}
        my={5}
        onClick={onNext}
      >
        Continue
      </Button>
    </>
  );
};

export default Learn;
