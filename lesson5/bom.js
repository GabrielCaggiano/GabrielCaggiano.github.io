document.getElementById("assignment-last-modified").innerHTML = document.lastModified;
document.getElementById("copy-year").innerHTML = new Date().getFullYear();



//defines the input
const input = document.querySelector('#favchap');
//selects the button element
const button = document.querySelector('button');
//select the ul
const list = document.getElementsByClassName('list');

button.onclick = function(){
    // all of our code will go here

    let newItem = input.value;
    input.value = '';

    //create new list item
    let listItem = document.createElement('li');
    //create a delete button for the list item
    let deletebutton = document.createElement('button');

    listItem.textContent = newItem;
   
    //append the delete button to the list item
    listItem.appendChild(deletebutton);
    //symbol for the delete button
    deletebutton.textContent = "🍕";
    
    list.appendChild(listItem);

    deleteButton.addEventListener('click', function() {
        // this line of code should use the removeChild()  method
        list.removeChild(listItem);
        // this line of code should move the cursor back to the input box using the focus (Links to an external site.) method. 
        input.focus();
      });

  };