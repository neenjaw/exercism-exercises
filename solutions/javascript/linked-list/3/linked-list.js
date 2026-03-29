const util = require('util')

class Node {
  constructor(v) {
    this.value = v;
    this.next = null;
  }
}

export class LinkedList {
  constructor() {
    this.nodes = null;
    this.length = 0;
  }

  push(value) {
    insertNodeAt(this, this.length, value);
  }

  pop() {
    return removeNthNode(this, this.length-1);
  }

  unshift(value) {
    insertNodeAt(this, 0, value);
  }

  shift() {
    return removeNthNode(this, 0);
  }

  delete(value) {
    return deleteValue(this, value);
  }

  count() {
    return this.length;
  }
}

// getNthNode
// Params:
//   - list: a list class object
//   - n: the 0-index of a node
//
// Resursively look for the nth node in the list, return the node.
const getNthNode = (list, n) => {
  function findNthNode(node, n) {
    if (n === 0) return node;
    return findNthNode(node.next, n-1);
  }

  return findNthNode(list.nodes, n);
}

// removeNthNode
// Params:
//   - list: a list class object
//   - n: the 0-index of a node
//
// Resursively look for the nth node in the list using getNthNode
// Update the singly linked list references, then return the value
const removeNthNode = (list, n) => {
  // If removing the first value from the list
  if (n === 0) {
    const node = list.nodes;
    list.nodes = node.next;
    list.length--;
    return node.value;
  }

  // If removing any other value, find the node prior to it
  const node = getNthNode(list, n-1)
  const value = node.next.value;
  node.next = node.next.next;
  list.length--;
  return value;
}

// insertNodeAt
// Params:
//   - list: a list class object
//   - n: the 0-index of where to insert the node
//   - value: the value to store in the list
//
// Resursively look for the nth-1 node in the list using getNthNode
// Create a new node to store the value then update references in the
// the list, return the new list length
const insertNodeAt = (list, n, value) => {
  if (n === 0) {
    const newNode = new Node(value)
    newNode.next = list.nodes;
    list.nodes = newNode;
    return list.length++;
  }

  const node = getNthNode(list, n-1);
  const newNode = new Node(value)
  newNode.next = node.next;
  node.next = newNode;
  return list.length++;
}


// deleteValue
// Params:
//   - list: a linked list class object
//   - value: the value to search for
//
// Function takes a list and removes the first occurance of the value
// in the singly linked list.  References updated.
const deleteValue = (list, value) => {
  let node = list.nodes;

  // if the first node in the list matches the value
  if (list.length >= 1 && node.value === value) {
    list.nodes = node.next;
    list.length--;
    return;
  }

  // look for subsequent nodes in the list that match
  while (node !== null) {
    if (node.next !== null && node.next.value === value) {
      node.next = node.next.next;
      list.length--;
      return;
    }

    node = node.next;
  }
}