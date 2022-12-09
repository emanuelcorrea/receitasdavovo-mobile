import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
  imageContainer: {
    backgroundColor: '#fff',
    flexDirection: 'column',
    position: 'relative',
  },
  image: {
    width: '100%',
    height: 250,
    shadowColor: "#000",
    shadowOffset: {
      width: 0,
      height: -2,
    },
    shadowOpacity: 1,
    shadowRadius: 5,
    elevation: 15,
  },
  title: {
    textAlign: 'center',
    marginTop: 20,
    fontSize: 20,
    fontWeight: '400',
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
  }
});

export default styles;