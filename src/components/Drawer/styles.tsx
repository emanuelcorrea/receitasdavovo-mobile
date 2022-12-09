import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#ecf0f1"
  },
  header: {
    alignItems: 'center',
    backgroundColor: '#FC9595'
  },
  imageProfile: {
    backgroundColor: '#fff',
    width: 100,
    height: 100,
    marginVertical: 20,
    borderRadius: 99,
  },
  userName: {
    textTransform: 'uppercase',
    fontSize: 17,
    fontFamily: 'Roboto',
    fontWeight: '700',
    borderTopColor: '#ffffff43',
    borderTopWidth: 1,
    color: '#fff',
    width: '100%',
    textAlign: 'center',
    padding: 20,
  },
  content: {
    flex: 1,
    backgroundColor: '#fbbaba'
  },
  menuList: {},
  menuItem: {
    paddingHorizontal: 20,
    paddingVertical: 20,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between'
  },
  itemName: {
    fontSize: 18,
    color: '#fff',
    fontWeight: '600',
  }
});

export default styles;