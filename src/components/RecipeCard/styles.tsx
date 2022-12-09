import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
  container: {
    shadowColor: "#000",
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.48,
    shadowRadius: 2,
    elevation: 5,
    overflow: 'hidden',
    borderBottomRightRadius: 25,
    borderBottomLeftRadius: 25,
    marginVertical: 10,
    marginHorizontal: 8
  },
  imageContainer: {
    position: 'relative',
  },
  image: {
    width: '100%',
    height: 267,
    borderBottomRightRadius: 25,
    borderBottomLeftRadius: 25,
  },
  titleContainer: {
    flex: 1,
    width: '100%',
    position: 'absolute',
    bottom: 0,
    alignItems: 'center',
    zIndex: 10,
  },
  title: {
    position: 'absolute',
    bottom: 0,
    backgroundColor: '#fff',
    borderTopLeftRadius: 20,
    borderTopRightRadius: 20,
    width: 230,
    height: 45,
    textAlign: 'center',
    textAlignVertical: 'center',
    fontSize: 16,
    color: '#8a8a8a',

    shadowColor: "#000",
    shadowOffset: {
      width: 0,
      height: -2,
    },
    shadowOpacity: 1,
    shadowRadius: 5,
    elevation: 15,
    zIndex: 1,
  }
});

export default styles;