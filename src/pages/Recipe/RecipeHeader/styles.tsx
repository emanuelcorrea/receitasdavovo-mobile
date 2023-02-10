import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
  imageContainer: {
    backgroundColor: '#fff',
    flexDirection: 'column',
    position: 'relative',
  },
  image: {
    width: '100%',
    height: 300,
    shadowColor: "#000",
    shadowOffset: {
      width: 0,
      height: -2,
    },
    shadowOpacity: 1,
    shadowRadius: 5,
    elevation: 15,
    borderBottomLeftRadius: 10,
    borderBottomRightRadius: 10,
  },
  line: {
    height: 1,
    backgroundColor: 'rgba(0, 0, 0, 0.12)',
    width: 50,
    position: 'absolute',
    bottom: 25,
  },
  lineLeft: {
    left: 0,
  },
  lineRight: {
    right: 0
  },
  lineBottom: {
    height: 6,
    marginTop: 10,
    width: 100,
    borderRadius: 5,
    alignSelf: 'center',
    backgroundColor: '#fc9898',
  },
  backButton: {
    position: 'absolute',
    left: 20,
    top: 20,
    zIndex: 10,
    height: 50,
    width: 50,
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    borderRadius: 100,
    backgroundColor: '#fff',
  }
});

export default styles;
