function addNewCourse(){
    let stream_id = document.getElementById('stream').value;
    let course_code = document.getElementById('course_code').value;
    let course_name = document.getElementById('course_name').value;
    let courselink_href = document.getElementById('courselink_href').value;
    let units = document.getElementById('units').value;
    let terms = document.getElementById('terms').value;
    // let PR_stream_id = document.getElementById('PR_stream_id').value;
    // let PR_course_code = document.getElementById('PR_course_code').value;
    // let IN_stream_id = document.getElementById('IN_stream_id').value;
    // let IN_course_code = document.getElementById('IN_course_code').value;

    let container = {stream_id, course_code, course_name, courselink_href, units, terms};
    console.log(JSON.stringify(container));

    let req = new XMLHttpRequest();
    req.onreadystatechange = function () {
        if (req.readyState === 4 && req.status === 200) {
            if (req.response) {
                console.log("Success");
            } else {
                console.log("Fail");
            }
        } else if (req.readyState === 4 && req.status === 400) {
            console.log(req.response);
        } else if (req.readyState === 4 && req.status !== 200){
            console.log("Error saving data to the database. Status: " + req.status);
        }
    }
    req.open("POST", "/users/addNewCourse");
    req.setRequestHeader('Content-Type', 'application/json');
    req.send(JSON.stringify(container));
}
