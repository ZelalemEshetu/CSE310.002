console.log("APP IS RUNNING");

// Firebase imports
import { initializeApp } from "https://www.gstatic.com/firebasejs/10.12.5/firebase-app.js";
import {
    getFirestore,
    collection,
    addDoc,
    getDocs,
    deleteDoc,
    doc
} from "https://www.gstatic.com/firebasejs/10.12.5/firebase-firestore.js";

// Firebase config
const firebaseConfig = {
    apiKey: "AIzaSyBGLtv0xlXUkR84epOCZ6pnd9d_inrcne8",
    authDomain: "studentmanager-508ee.firebaseapp.com",
    projectId: "studentmanager-508ee",
    storageBucket: "studentmanager-508ee.appspot.com",
    messagingSenderId: "272001970883",
    appId: "1:272001970883:web:ce71dd5311a474c7836876"
};

const app = initializeApp(firebaseConfig);
const db = getFirestore(app);
const studentsRef = collection(db, "students");

// DOM (SAFE CHECK)
const nameInput = document.getElementById("name");
const idInput = document.getElementById("id");
const courseInput = document.getElementById("course");
const addBtn = document.getElementById("addBtn");
const list = document.getElementById("list");

if (!addBtn) {
    console.error("❌ addBtn not found. Check HTML id='addBtn'");
}

// ADD STUDENT
addBtn.addEventListener("click", async () => {
    try {
        console.log("Adding student...");

        await addDoc(studentsRef, {
            name: nameInput.value,
            id: idInput.value,
            course: courseInput.value
        });

        console.log("Student added successfully");

        nameInput.value = "";
        idInput.value = "";
        courseInput.value = "";

        loadStudents();

    } catch (error) {
        console.error("ERROR adding student:", error);
    }
});

// LOAD STUDENTS
async function loadStudents() {
    list.innerHTML = "";

    try {
        const data = await getDocs(studentsRef);

        console.log("Students found:", data.size);

        if (data.empty) {
            list.innerHTML = "<li>No students found</li>";
            return;
        }

        data.forEach((student) => {
            const s = student.data();

            const li = document.createElement("li");
            li.textContent = `${s.name} - ${s.id} - ${s.course}`;

            const delBtn = document.createElement("button");
            delBtn.textContent = "Delete";

            delBtn.onclick = async () => {
                await deleteDoc(doc(db, "students", student.id));
                loadStudents();
            };

            li.appendChild(delBtn);
            list.appendChild(li);
        });

    } catch (error) {
        console.error("ERROR loading students:", error);
    }
}

// START
loadStudents();