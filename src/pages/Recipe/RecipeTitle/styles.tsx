import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
  titleContainer: {
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    flex: 1,
    backgroundColor: '#fff',
    
    paddingVertical: 20,
    paddingHorizontal: 25,
    borderRadius: 15,
    marginHorizontal: 15,
    elevation: 7,
    shadowColor: '#00000075',
  },
  recipeTitle: {
    textAlign: 'center',
    marginBottom: 10,
    fontSize: 22,
    fontWeight: '400',
  },
});

export default styles;
