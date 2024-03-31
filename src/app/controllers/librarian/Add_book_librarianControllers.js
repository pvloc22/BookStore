const express = require('express');
const app = express();
const fs = require('fs');
const path = require('path');
const Add_book_librarianModel = require('../../../model/librarian/Add_book_librarian.model')


class Add_book_librarianControllers {
    Add_book_librarianGet(req, res) {
        const url_auth = { pass: req.session.user.password }

        res.render('Add_book_librarian', { layout: 'Librarian_Layout.hbs', URL_AUTH: url_auth });

    }
    check_token(req, res, next) {
        try {
            const token = req.params.token
            const token_ss = req.session.user.password
            if (token == token_ss) {
                next()
                return
            }
            throw 'Token not compare'
        } catch (error) {
            res.redirect('/erro')
        }
    }
    Add_book_librarianPost(req, res) {
        const sourcePath = req.file.path;
        const customName = req.body.tittle.replace(/\s+/g, '-'); // Nhận tên tùy chỉnh từ yêu cầu
        const pathImage = 'images/'+ customName +  path.extname(sourcePath)
        const destinationPath = path.join(__dirname, '../../../public/images/' + customName + path.extname(sourcePath));

        Add_book_librarianModel.insert_book(req.body, pathImage, (err, data)=>{
            if(err){
                res.status(500).send('Error insert a book');
            }
            else{
                fs.readFile(sourcePath, (err, data) => {
                    if (err) {
                        console.error(err);
                        res.status(500).send('Error reading source image');
                        return;
                    }
        
                    fs.writeFile(destinationPath, data, err => {
                        if (err) {
                            console.error(err);
                            res.status(500).send('Error moving image');
                            return;
                        }
        
                        fs.unlink(sourcePath, err => {
                            if (err) {
                                console.error(err);
                                res.status(500).send('Error deleting source image');
                                return;
                            }
                            res.send('successfully insert a book');
                        });
                    });
                });
            }
        })



    }
}


module.exports = new Add_book_librarianControllers;
