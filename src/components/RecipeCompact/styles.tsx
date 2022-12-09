import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
  recipeContainer: {
    borderRadius: 10,
    flexDirection: 'row',
    position: 'relative',
    padding: 10,
    backgroundColor: '#fff'
  },
  recipeImage: {
    flex: 1,
    minHeight: 90,
    width: 170,
    borderRadius: 10
  },
  recipeDescription: {
    paddingHorizontal: 10,
    flex: 1
  },
  recipeTitle: {
    fontWeight: '500',
    fontSize: 17
  },
  recipeRate: {
    flexDirection: 'row',
    marginTop: 15
  },
  recipeCategory: {
    width: '100%',
    textAlign: 'center',
    borderWidth: 1,
    borderColor: '#fc9898',
    color: '#fc9898',
    borderRadius: 3,
    marginTop: 5,
    fontSize: 13,
    paddingVertical: 3,

  }
});

export default styles;