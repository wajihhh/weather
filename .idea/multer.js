// const multer = require('multer');
// const path = require('path');

// // Set up multer storage
// const storage = multer.diskStorage({
//     destination: function (req, file, cb) {
//         cb(null, 'uploads/'); // Directory where files will be saved
//     },
//     filename: function (req, file, cb) {
//         cb(null, Date.now() + path.extname(file.originalname)); // Rename file to avoid collisions
//     },
// });

// const upload = multer({ storage: storage });
