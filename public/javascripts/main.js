// TODO:
// Impliment degree courses, pre_requisites, incompatibles
// free to use the arrays in vue for form input

const vuectrl = Vue.createApp({
    data() {
        return {
            placeholder: "Result placeholder",
            stream: [],
            level: [],
            course: [],
            degree: [],
            searchQuery: '',
            degree_course: [],
            type: ["core", "elective","core & elective", "project", "core & project", "elective & project", "core, elective & project"],
            // term: ["", "Semester 1", "Semester 2", "All Semesters", "Trimester 1", "Trimester 2", "Trimester 3", "All Trimesters"],
            term: {
                0: {t: 0, s: ""},
                1: {t: 1, s: "Semester 1"},
                2: {t: 2, s: "Semester 2"},
                3: {t: 3, s: "All Semesters"},
                4: {t: 4, s: "Trimester 1"},
                5: {t: 5, s: "Trimester 2"},
                6: {t: 6, s: "Trimester 3"},
                7: {t: 7, s: "All Trimesters"}
            },
            pre_requisites: [],
            incompatibles: [],
            errorMessage: null,
            displayDegree: true,
            displayCourse: false
        };
    },
    methods: {
        toggleDisplay(type) {
            if (type === 'degree') {
                this.displayDegree = true;
                this.displayCourse = false;
            } else if (type === 'course') {
                this.displayDegree = false;
                this.displayCourse = true;
            }
        },
        
        doSearching() {
            const searchQuery = this.searchQuery.trim(); 
            const searchScope = document.getElementById("demo-label").value;
            if (searchQuery) {
                let apiUrl = ''; 
    
                switch (searchScope) {
                    case 'get_courses':
                        apiUrl = `/api/search?course-name=${searchQuery}`;
                        break;
                    case 'get_Degrees':
                        apiUrl = `/api/search?degree-name=${searchQuery}`;
                        break;
                    default:
                        apiUrl = `/api/search?all-categories=${searchQuery}`;
                        break;
                }
    
            
                fetch(apiUrl)
                    .then(response => response.json())
                    .then(data => {
                    
                        this.course = data.courses;
                        this.degree = data.degrees;
                    })
                    .catch(error => {
                        console.error("Error fetching search results:", error);
                    });
                } else {
                    alert("Please enter a search.");
                }
        },
        
        doLogin() {
            console.log("login...");
            window.location.href = "login.html";
        },
        dataUpdate(){
            vuectrl.fetchData("/api/course_streams", "stream");
            vuectrl.fetchData("/api/degree_levels", "level");
            vuectrl.fetchData("/api/courses", "course");
            vuectrl.fetchData("/api/degrees", "degree");
            // vuectrl.fetchData("/api/degree_courses", "degree_course");
            // vuectrl.fetchData("/api/pre_requisites", "pre_requisite");
            // vuectrl.fetchData("/api/incompatibles", "incompatibles");
        },
        fetchData(target_loc, dest_var){
            let req = new XMLHttpRequest();
            req.onreadystatechange = function () {
                if (req.readyState === 4 && req.status === 200) {
                    if (req.response) {
                        vuectrl[dest_var] = JSON.parse(req.response);
                    }
                } else if (req.readyState === 4 && req.status !== 200) {
                    vuectrl.errorMessage = "Error fetching data from " + target_loc + ". Status: " + req.status;
                }
            };
            req.open("GET", target_loc);
            req.send();
        }
    }
}).mount('#mainDiv');

vuectrl.dataUpdate();



