import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
  content: {
    flex: 1,
    backgroundColor: '#fff',
    flexDirection: 'column',
    padding: 15
  },
  listContainer: {
    backgroundColor: '#f2f2f2',
    width: '100%',
    borderRadius: 10,
    marginTop: 20
  },
  listItems: {
    padding: 15
  },
  item: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 0,
  },
  itemName: {
    fontSize: 16,
    fontWeight: "500"
  },
  itemIcon: {
    fontSize: 30,
  },
  itemPrefix: {
    color: "#fc9898",
    paddingRight: 10
  },
  itemOrdered: {
    fontSize: 20,
    marginBottom: 10
  },
  titleContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    padding: 15,
    borderRadius: 10,
    backgroundColor: '#ececec',
  },
  title: {
    color: '#fc9898',
    fontSize: 18,
    textTransform: 'uppercase',
    marginLeft: 15,
    fontWeight: '500'
  },
});

export default styles;