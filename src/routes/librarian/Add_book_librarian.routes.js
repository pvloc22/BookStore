const express = require('express');
const router = express.Router();
const add_book_librarianControllers = require('../../app/controllers/librarian/Add_book_librarianControllers')
const fs = require('fs');
const path = require('path');
const multer = require('multer');

const app = express();
const port = 3000;

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, path.join(__dirname,'../../public/images'));
    },
    filename: function (req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
    }
});

const upload = multer({ storage: storage });

app.use(express.static(path.join(__dirname, 'public')));


router.post('/insert_book', upload.single('image'),add_book_librarianControllers.Add_book_librarianPost)
router.get('/:token', add_book_librarianControllers.check_token, add_book_librarianControllers.Add_book_librarianGet)

module.exports = router

