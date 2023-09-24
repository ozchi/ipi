const express = require('express');
const sanitizeHtml = require('sanitize-html');
const router = express.Router();

router.get('/search', (req, res) => {
    const query = sanitizeHtml(req.query['course-name'] || req.query['degree-name'] || req.query['all-categories']).trim();
    
    console.log("Search query:", query);
    
    if (!query) {
        return res.status(400).json({ error: "Search query cannot be empty." });
    }  

    if (req.query['course-name'] || req.query['all-categories']) {
        req.pool.query('SELECT * FROM course WHERE course_name LIKE ? OR course_code LIKE ?', [`%${query}%`, `%${query}%`], (err, courseResults) => {
            if (err) {
                console.error("Error querying courses:", err.message);  
                return res.status(500).json({ error: err.message });
            }

            console.log("Course results:", courseResults);  

            if (req.query['degree-name'] || req.query['all-categories']) {
                req.pool.query('SELECT * FROM degree WHERE name_suffix LIKE ?', [`%${query}%`], (err, degreeResults) => {
                    if (err) {
                        console.error("Error querying degrees:", err.message);  
                        return res.status(500).json({ error: err.message });
                    }
                    console.log("Degree results:", degreeResults);  
                    res.json({ courses: courseResults, degrees: degreeResults });
                });
            } else {
                res.json({ courses: courseResults, degrees: [] });
            }
        });
    } else if (req.query['degree-name']) {
        req.pool.query('SELECT * FROM degree WHERE degree_name LIKE ?', [`%${query}%`], (err, degreeResults) => {
            if (err) {
                console.error("Error querying degrees:", err.message);  
                return res.status(500).json({ error: err.message });
            }
            console.log("Degree results:", degreeResults);  
            res.json({ courses: [], degrees: degreeResults });
        });
    } else {
        res.json({ courses: [], degrees: [] });
    }
});


module.exports = router;

