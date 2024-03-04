//
//  ContentView.swift
//  To Do List
//
//  Created by StudentAM on 2/29/24.
//

import SwiftUI

struct ContentView: View {
    @State var task: String = ""
    @State var print: [String] =  []
    var body: some View {
        //Teh navogation view is used to align tittle or just things in general ( they're usually aligned in the upper left corner)
        NavigationView{
            //VStack is use to display thing vertically
            VStack {
                //Hstack is use to display things horizontally
                HStack{
                    //text is use to display words
                    Text("Number of tasks:")
                    // spacer are use to take space from on side and put on the other
                    Spacer()
                }
                //look at line 22
                Spacer()
                //Textfields is like a text box where you can type in
                TextField("Enter Task", text: $task)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                //look at line 18
                HStack{
                    //Button is used to make an action
                    Button(action: {
                        print.append(task)
                    }, label: {
                        //Text on what the button used for 
                        Text("Add Task")
                            .padding(12)
                            .background(!task.isEmpty ? Color.blue: Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    })
                    //look at line 32
                    Button(action: {
                        print = []
                    }, label: {
                        //look at line 36
                        Text("Remove All Task")
                            .padding(12)
                            .background(!print.isEmpty ? Color.blue: Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    })
                }
                //look at line 22
                Spacer()
                .navigationTitle("To-Do List")
                //List allows put iteams in a list form
                List{
                    ForEach(print, id: \.self){ item in
                        Text("\(item)")
                    }
                    //this calls a func that lets you delete iteams from the list 
                    .onDelete(perform: deleteItem)
                }
            }
            //padding is so there is space to your liking between the things displayed on your task
            .padding()
        }
    }
    //this is used to delete iteams from your list, this func is called in line 64
    func deleteItem(offset: IndexSet){
        print.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
