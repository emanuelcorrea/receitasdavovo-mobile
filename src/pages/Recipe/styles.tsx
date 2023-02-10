import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
  content: {
    flex: 1,
    borderTopLeftRadius: 40,
    borderTopRightRadius: 40,
    flexDirection: 'column',
    marginTop: -45,
    marginBottom: 20
  },
  listContainer: {
    flex: 1,
    borderRadius: 15,
    padding: 15,
    marginTop: 20,
    marginHorizontal: 20,
    elevation: 7,
    shadowColor: '#00000075',
    backgroundColor: '#fff',
  },
  listItems: {
    padding: 15
  },
  item: {
    display: 'flex',
    flexDirection: 'row',
    marginBottom: 0,
  },
  itemName: {
    fontSize: 16,
    fontWeight: "500",
  },
  itemIcon: {
    marginLeft: -7,
    marginRight: -5
  },
  itemPrefix: {
    color: "#fc9898",
    paddingRight: 10,
    marginTop: -3,
    marginBottom: 10,
  },
  itemOrdered: {
    fontSize: 20,
    marginBottom: 10,
  },
  titleContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    borderRadius: 10,
  },
  iconTitle: {
    backgroundColor: '#f7f7f7',
    borderRadius: 50,
    width: 45,
    height: 45,
    alignContent: 'center',
    textAlign: 'center',
    textAlignVertical: 'center',
    elevation: 3,
    shadowColor: '#00000031'
  },
  title: {
    color: '#fc9898',
    fontSize: 18,
    textTransform: 'uppercase',
    marginLeft: 15,
    fontWeight: '500',
  },
});

export default styles;
