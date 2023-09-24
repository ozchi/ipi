router.get('/search', (req, res) => {
    const query = sanitizeHtml(req.query['course-name'] || req.query['degree-name'] || req.query['all-categories']);
    
    if (req.query['course-name']) {
        
        req.pool.query('SELECT * FROM course WHERE course_name LIKE ? OR course_code LIKE ?', [`%${query}%`, `%${query}%`], (err, results) => {
            if (err) {
                res.status(500).json({ error: err.message });
            } else {
                res.json({ courses: results, degrees: [] });
            }
        });
    } else if (req.query['degree-name']) {
        
        req.pool.query('SELECT * FROM degree WHERE degree_name LIKE ?', [`%${query}%`], (err, results) => {
            if (err) {
                res.status(500).json({ error: err.message });
            } else {
                res.json({ courses: [], degrees: results });
            }
        });
    } else {
        
        req.pool.query('SELECT * FROM course WHERE course_name LIKE ? OR course_code LIKE ?', [`%${query}%`, `%${query}%`], (err, results) => {
            if (err) {
                res.status(500).json({ error: err.message });
            } else {
                res.json({ courses: results, degrees: [] });
            }
        });
    }
});
