import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:my_cv/components/default_button.dart';
import 'package:my_cv/constants.dart';
import 'package:my_cv/size_config.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  bool isSelected1 = true;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;

  String descri = '';

  String p_ex1 = '';
  String d_ex1 = '';
  String p_ex2 = '';
  String d_ex2 = '';
  String p_ex3 = '';
  String d_ex3 = '';

  String e_ex1 = '';
  String de_ex1 = '';
  String e_ex2 = '';
  String de_ex2 = '';
  String e_ex3 = '';
  String de_ex3 = '';

  String h_ex1 = '';
  String hd_ex1 = '';
  String h_ex2 = '';
  String hd_ex2 = '';
  String h_ex3 = '';
  String hd_ex3 = '';

  String email = '';
  String tel = '';
  String lkdin = '';
  String city = '';

  String comp1 = "";
  String comp2 = "";
  String comp3 = "";
  String comp4 = "";

  String lang1 = "";
  String lang2 = "";
  String lang3 = "";

  String hobby1 = '';
  String hobby2 = "";
  String hobby3 = "";

  String name = '';
  String job = '';

  PdfBrush theme = PdfBrushes.indianRed;

  PickedFile _image;
  String _imagePath;

  void initState() {
    super.initState();
    _loadImage();
  }

  Future _getImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future _saveImage(path) async {
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    saveImage.setString("imagePath", path);
  }

  Future _loadImage() async {
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    setState(() {
      _imagePath = saveImage.getString("imagePath");
    });
  }

  // partie pdf

  Future<PdfFont> getFont(TextStyle style, double n) async {
    //Get the external storage directory
    Directory directory = await getApplicationSupportDirectory();
    //Create an empty file to write the font data
    File file = File('${directory.path}/${style.fontFamily}.ttf');
    List<int> fontBytes;
    //Check if entity with the path exists
    if (file.existsSync()) {
      fontBytes = await file.readAsBytes();
    }
    if (fontBytes != null && fontBytes.isNotEmpty) {
      //Return the google font
      return PdfTrueTypeFont(fontBytes, n);
    } else {
      //Return the default font
      return PdfStandardFont(PdfFontFamily.helvetica, n);
    }
  }

  Future<void> createPDF() async {
//Create a new PDF document
    PdfDocument document = PdfDocument();

    document.pageSettings.margins.all = 0;
//Add a page to the document
    PdfPage page = document.pages.add();

//Initialize PdfGrid for drawing the table
    PdfGrid grid = PdfGrid();
    PdfGrid grid2 = PdfGrid();
    PdfGrid grid3 = PdfGrid();

//Add the columns to grid and grid2
    grid.columns.add(count: 2);
    grid.columns[0].width = 20;
    grid.columns[1].width = 180;
    grid2.columns.add(count: 1);
    grid3.columns.add(count: 7);
    grid3.columns[0].width = 90;
    grid3.columns[1].width = 19;
    grid3.columns[2].width = 19;
    grid3.columns[3].width = 19;
    grid3.columns[4].width = 19;
    grid3.columns[5].width = 19;
    grid3.columns[6].width = 15;

    ///grid style
    grid.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 2, right: 7, top: 4, bottom: 5),
    );

    ///borders
    PdfBorders whitebord = PdfBorders(
        left: PdfPen(PdfColor(255, 255, 255)),
        top: PdfPen(PdfColor(255, 255, 255)),
        bottom: PdfPen(PdfColor(255, 255, 255)),
        right: PdfPen(
          PdfColor(255, 255, 255),
        ));

    PdfBorders emptybord = PdfBorders(
      left: PdfPen(PdfColor.empty),
      top: PdfPen(PdfColor.empty),
      bottom: PdfPen(PdfColor.empty),
      right: PdfPen(PdfColor.empty),
    );

    ///row3
    PdfGridRow row3 = grid2.rows.add();

    row3.cells[0].value = name;
    row3.cells[0].style = PdfGridCellStyle(
        borders: whitebord,
        backgroundBrush: PdfBrushes.transparent,
        cellPadding: PdfPaddings(left: 2, right: 3, top: 2, bottom: -2),
        font: await getFont(GoogleFonts.workSans(), 30),
        textBrush: theme);

    ///row4
    PdfGridRow row4 = grid2.rows.add();

    row4.cells[0].value = job;
    row4.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: -2, bottom: 0),
      font: await getFont(GoogleFonts.raleway(), 15),
      textBrush: PdfBrushes.slateGray,
    );

    ///row5 description
    PdfGridRow row5 = grid2.rows.add();
    row5.height = 110;
    row5.cells[0].value = descri;
    row5.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 37, top: 5, bottom: 10),
      font: await getFont(GoogleFonts.raleway(), 15),
      textBrush: PdfBrushes.black,
    );
    row5.cells[0].style.stringFormat = PdfStringFormat(
      alignment: PdfTextAlignment.justify,
      lineAlignment: PdfVerticalAlignment.middle,
    );

    ///row6
    PdfGridRow row6 = grid2.rows.add();
    row6.cells[0].value = "PROFESSIONAL EXPERIENCE";
    row6.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 5, bottom: 2),
      font: await getFont(GoogleFonts.workSans(), 21),
      textBrush: theme,
    );

    ///row7
    PdfGridRow row7 = grid2.rows.add();
    row7.cells[0].value = p_ex1;
    row7.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 5, bottom: -4),
      font: await getFont(GoogleFonts.raleway(), 19),
      textBrush: PdfBrushes.black,
    );

    ///row8
    PdfGridRow row8 = grid2.rows.add();
    row8.cells[0].value = d_ex1;
    row8.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 0, bottom: 2),
      font: await getFont(GoogleFonts.raleway(), 13),
      textBrush: PdfBrushes.black,
    );

    ///row9
    PdfGridRow row9 = grid2.rows.add();
    row9.cells[0].value = p_ex2;
    row9.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 5, bottom: -4),
      font: await getFont(GoogleFonts.raleway(), 19),
      textBrush: PdfBrushes.black,
    );

    ///row10
    PdfGridRow row10 = grid2.rows.add();
    row10.cells[0].value = d_ex2;
    row10.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 0, bottom: 2),
      font: await getFont(GoogleFonts.raleway(), 13),
      textBrush: PdfBrushes.black,
    );

    ///row11
    PdfGridRow row11 = grid2.rows.add();
    row11.cells[0].value = p_ex3;
    row11.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 5, bottom: -4),
      font: await getFont(GoogleFonts.raleway(), 19),
      textBrush: PdfBrushes.black,
    );

    ///row12
    PdfGridRow row12 = grid2.rows.add();
    row12.cells[0].value = d_ex3;
    row12.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 0, bottom: 2),
      font: await getFont(GoogleFonts.raleway(), 13),
      textBrush: PdfBrushes.black,
    );

    ///row13
    PdfGridRow row13 = grid2.rows.add();
    row13.cells[0].value = "EDUCATION";
    row13.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 5, bottom: 2),
      font: await getFont(GoogleFonts.workSans(), 21),
      textBrush: theme,
    );

    ///row14
    PdfGridRow row14 = grid2.rows.add();
    row14.cells[0].value = e_ex1;
    row14.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 5, bottom: -4),
      font: await getFont(GoogleFonts.raleway(), 19),
      textBrush: PdfBrushes.black,
    );

    ///row15
    PdfGridRow row15 = grid2.rows.add();
    row15.cells[0].value = de_ex1;
    row15.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 0, bottom: 2),
      font: await getFont(GoogleFonts.raleway(), 13),
      textBrush: PdfBrushes.black,
    );

    ///row16
    PdfGridRow row16 = grid2.rows.add();
    row16.cells[0].value = e_ex2;
    row16.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 5, bottom: -4),
      font: await getFont(GoogleFonts.raleway(), 19),
      textBrush: PdfBrushes.black,
    );

    ///row17
    PdfGridRow row17 = grid2.rows.add();
    row17.cells[0].value = de_ex2;
    row17.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 0, bottom: 2),
      font: await getFont(GoogleFonts.raleway(), 13),
      textBrush: PdfBrushes.black,
    );
    PdfGridRow row18 = grid2.rows.add();
    row18.cells[0].value = e_ex3;
    row18.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 5, bottom: -4),
      font: await getFont(GoogleFonts.raleway(), 19),
      textBrush: PdfBrushes.black,
    );

    ///row19
    PdfGridRow row19 = grid2.rows.add();
    row19.cells[0].value = de_ex3;
    row19.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 0, bottom: 2),
      font: await getFont(GoogleFonts.raleway(), 13),
      textBrush: PdfBrushes.black,
    );

    ///row20
    PdfGridRow row20 = grid2.rows.add();
    row20.cells[0].value = "EXTRACURRICULAR ACTIVITIES";
    row20.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 5, bottom: 2),
      font: await getFont(GoogleFonts.workSans(), 21),
      textBrush: theme,
    );

    ///row21
    PdfGridRow row21 = grid2.rows.add();
    row21.cells[0].value = h_ex1;
    row21.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 5, bottom: -4),
      font: await getFont(GoogleFonts.raleway(), 19),
      textBrush: PdfBrushes.black,
    );

    ///row15
    PdfGridRow row22 = grid2.rows.add();
    row22.cells[0].value = hd_ex1;
    row22.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 0, bottom: 2),
      font: await getFont(GoogleFonts.raleway(), 13),
      textBrush: PdfBrushes.black,
    );

    ///row23
    PdfGridRow row23 = grid2.rows.add();
    row23.cells[0].value = h_ex2;
    row23.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 5, bottom: -4),
      font: await getFont(GoogleFonts.raleway(), 19),
      textBrush: PdfBrushes.black,
    );

    ///row24
    PdfGridRow row24 = grid2.rows.add();
    row24.cells[0].value = hd_ex2;
    row24.cells[0].style = PdfGridCellStyle(
      borders: whitebord,
      backgroundBrush: PdfBrushes.transparent,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 0, bottom: 2),
      font: await getFont(GoogleFonts.raleway(), 13),
      textBrush: PdfBrushes.black,
    );

    /// colonne 0
    ///row25
    PdfGridRow row25 = grid.rows.add();
    row25.height = 180;
    row25.cells[1].style = PdfGridCellStyle(
      borders: emptybord,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 25),
      textBrush: PdfBrushes.black,
    );
    row25.cells[0].style = PdfGridCellStyle(borders: emptybord);

    ///row26
    PdfGridRow row26 = grid.rows.add();
    row26.cells[1].value = "CONTACT";
    row26.cells[1].style = PdfGridCellStyle(
      borders: emptybord,
      cellPadding: PdfPaddings(left: 0, right: 3, top: 10, bottom: 2),
      font: await getFont(GoogleFonts.workSans(), 21),
      textBrush: PdfBrushes.white,
    );
    row26.cells[0].style = PdfGridCellStyle(borders: emptybord);

    ///row27a
    PdfGridRow row27a = grid.rows.add();
    row27a.cells[1].value = "  " + email;
    row27a.cells[1].style = PdfGridCellStyle(
      borders: emptybord,
      cellPadding: PdfPaddings(left: 4, right: 3, top: 0, bottom: 2),
      font: await getFont(GoogleFonts.raleway(), 13),
      textBrush: PdfBrushes.white,
      format: PdfStringFormat(
        lineAlignment: PdfVerticalAlignment.middle,
      ),
    );

    //Loads the image from base64 string
    PdfImage mail = PdfBitmap.fromBase64String(
        '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');
    row27a.cells[0].style = PdfGridCellStyle(
      borders: emptybord,
      backgroundImage: mail,
      cellPadding: PdfPaddings(left: 8, top: 5, bottom: 5),
    );

    ///row27b
    PdfGridRow row27b = grid.rows.add();
    row27b.cells[1].value = "  " + lkdin;
    row27b.cells[1].style = PdfGridCellStyle(
      borders: emptybord,
      cellPadding: PdfPaddings(left: 4, right: 3, top: 0, bottom: 2),
      font: await getFont(GoogleFonts.raleway(), 13),
      textBrush: PdfBrushes.white,
      format: PdfStringFormat(
        lineAlignment: PdfVerticalAlignment.middle,
      ),
    );
    //Loads the image from base64 string
    PdfImage linkedin = PdfBitmap.fromBase64String(
        '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');

    row27b.cells[0].style = PdfGridCellStyle(
      borders: emptybord,
      backgroundImage: linkedin,
      cellPadding: PdfPaddings(left: 8, top: 5, bottom: 5),
    );

    ///row27c
    PdfGridRow row27c = grid.rows.add();
    row27c.cells[1].value = "  " + tel;
    row27c.cells[1].style = PdfGridCellStyle(
      borders: emptybord,
      cellPadding: PdfPaddings(left: 4, right: 3, top: 0, bottom: 2),
      font: await getFont(GoogleFonts.raleway(), 13),
      textBrush: PdfBrushes.white,
      format: PdfStringFormat(
        lineAlignment: PdfVerticalAlignment.middle,
      ),
    );

    //Loads the image from base64 string
    PdfImage phone = PdfBitmap.fromBase64String(
        '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');

    row27c.cells[0].style = PdfGridCellStyle(
      borders: emptybord,
      backgroundImage: phone,
      cellPadding: PdfPaddings(left: 10, top: 5, bottom: 5),
    );

    ///row27c
    PdfGridRow row27d = grid.rows.add();
    row27d.cells[1].value = "  " + city;
    row27d.cells[1].style = PdfGridCellStyle(
      borders: emptybord,
      cellPadding: PdfPaddings(left: 4, right: 3, top: 0, bottom: 2),
      font: await getFont(GoogleFonts.raleway(), 13),
      textBrush: PdfBrushes.white,
      format: PdfStringFormat(
        lineAlignment: PdfVerticalAlignment.middle,
      ),
    );

    //Loads the image from base64 string
    PdfImage place = PdfBitmap.fromBase64String(
        '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');

    row27d.cells[0].style = PdfGridCellStyle(
      backgroundImage: place,
      cellPadding: PdfPaddings(left: 8, top: 5, bottom: 5),
      borders: emptybord,
    );

    ///row28
    PdfGridRow row28 = grid.rows.add();
    row28.cells[1].value = "SKILLS";
    row28.cells[1].style = PdfGridCellStyle(
      borders: emptybord,
      cellPadding: PdfPaddings(left: 0, right: 3, top: 20, bottom: 2),
      font: await getFont(GoogleFonts.workSans(), 21),
      textBrush: PdfBrushes.white,
    );
    row28.cells[0].style = PdfGridCellStyle(borders: emptybord);

    ///row29
    PdfGridRow row29 = grid.rows.add();
    row29.cells[1].value = comp1 + '\n' + comp2 + '\n' + comp3 + '\n' + comp4;
    row29.cells[1].style = PdfGridCellStyle(
      borders: emptybord,
      cellPadding: PdfPaddings(left: 4, right: 3, top: 0, bottom: 2),
      font: await getFont(GoogleFonts.raleway(), 13),
      textBrush: PdfBrushes.white,
    );
    row29.cells[0].style = PdfGridCellStyle(borders: emptybord);

    ///row31a
    PdfGridRow row31a = grid3.rows.add();
    row31a.cells[0].value = lang1;
    row31a.cells[0].style = PdfGridCellStyle(
      borders: emptybord,
      cellPadding: PdfPaddings(left: 24, right: 3, top: 0, bottom: 2),
      font: await getFont(GoogleFonts.raleway(), 13),
      textBrush: PdfBrushes.white,
      format: PdfStringFormat(
        lineAlignment: PdfVerticalAlignment.middle,
      ),
    );
    row31a.cells[1].style = PdfGridCellStyle(
        borders: emptybord,
        cellPadding: PdfPaddings(left: 5, right: 5, top: 6, bottom: 6));
    row31a.cells[2].style = PdfGridCellStyle(
        borders: emptybord,
        cellPadding: PdfPaddings(left: 5, right: 5, top: 6, bottom: 6));
    row31a.cells[3].style = PdfGridCellStyle(
        borders: emptybord,
        cellPadding: PdfPaddings(left: 5, right: 5, top: 6, bottom: 6));
    row31a.cells[4].style = PdfGridCellStyle(
        borders: emptybord,
        cellPadding: PdfPaddings(left: 5, right: 5, top: 6, bottom: 6));
    row31a.cells[5].style = PdfGridCellStyle(
        borders: emptybord,
        cellPadding: PdfPaddings(left: 5, right: 5, top: 6, bottom: 6));
    row31a.cells[6].style = PdfGridCellStyle(
      borders: emptybord,
    );

    ///row31b
    PdfGridRow row31b = grid3.rows.add();
    row31b.cells[0].value = lang2;
    row31b.cells[0].style = PdfGridCellStyle(
      borders: emptybord,
      cellPadding: PdfPaddings(left: 24, right: 3, top: 0, bottom: 2),
      font: await getFont(GoogleFonts.raleway(), 13),
      textBrush: PdfBrushes.white,
      format: PdfStringFormat(
        lineAlignment: PdfVerticalAlignment.middle,
      ),
    );
    row31b.cells[1].style = PdfGridCellStyle(
        borders: emptybord,
        cellPadding: PdfPaddings(left: 5, right: 5, top: 6, bottom: 6));
    row31b.cells[2].style = PdfGridCellStyle(
        borders: emptybord,
        cellPadding: PdfPaddings(left: 5, right: 5, top: 6, bottom: 6));
    row31b.cells[3].style = PdfGridCellStyle(
        borders: emptybord,
        cellPadding: PdfPaddings(left: 5, right: 5, top: 6, bottom: 6));
    row31b.cells[4].style = PdfGridCellStyle(
        borders: emptybord,
        cellPadding: PdfPaddings(left: 5, right: 5, top: 6, bottom: 6));
    row31b.cells[5].style = PdfGridCellStyle(
      borders: emptybord,
    );
    row31b.cells[6].style = PdfGridCellStyle(
      borders: emptybord,
    );

    ///row31c
    PdfGridRow row31c = grid3.rows.add();
    row31c.cells[0].value = lang3;
    row31c.cells[0].style = PdfGridCellStyle(
      borders: emptybord,
      cellPadding: PdfPaddings(left: 24, right: 3, top: 0, bottom: 2),
      font: await getFont(GoogleFonts.raleway(), 13),
      textBrush: PdfBrushes.white,
      format: PdfStringFormat(
        lineAlignment: PdfVerticalAlignment.middle,
      ),
    );
    row31c.cells[1].style = PdfGridCellStyle(
        borders: emptybord,
        cellPadding: PdfPaddings(left: 5, right: 5, top: 6, bottom: 6));
    row31c.cells[2].style = PdfGridCellStyle(
        borders: emptybord,
        cellPadding: PdfPaddings(left: 5, right: 5, top: 6, bottom: 6));
    row31c.cells[3].style = PdfGridCellStyle(
        borders: emptybord,
        cellPadding: PdfPaddings(left: 5, right: 5, top: 6, bottom: 6));
    row31c.cells[4].style = PdfGridCellStyle(
        borders: emptybord,
        cellPadding: PdfPaddings(left: 5, right: 5, top: 6, bottom: 6));
    row31c.cells[5].style = PdfGridCellStyle(
      borders: emptybord,
    );
    row31c.cells[6].style = PdfGridCellStyle(
      borders: emptybord,
    );

    ///row32
    PdfGridRow row32 = grid.rows.add();
    row32.cells[1].value = "HOBBIES";
    row32.cells[1].style = PdfGridCellStyle(
      borders: emptybord,
      cellPadding: PdfPaddings(left: 0, right: 3, top: 20, bottom: 2),
      font: await getFont(GoogleFonts.workSans(), 21),
      textBrush: PdfBrushes.white,
    );
    row32.cells[0].style = PdfGridCellStyle(borders: emptybord);

    ///row33
    PdfGridRow row33 = grid.rows.add();
    row33.cells[1].value = hobby1 + '\n' + hobby2 + '\n' + hobby3;
    row33.cells[1].style = PdfGridCellStyle(
      borders: emptybord,
      cellPadding: PdfPaddings(left: 4, right: 3, top: 0, bottom: 2),
      font: await getFont(GoogleFonts.raleway(), 13),
      textBrush: PdfBrushes.white,
    );
    row33.cells[0].style = PdfGridCellStyle(borders: emptybord);

//Draw the rectangle on PDF document
    page.graphics.drawRectangle(
        brush: theme,
        bounds: Rect.fromLTWH(0, 0, 200, page.getClientSize().height));

    ///row30
    PdfGridRow row30 = grid.rows.add();
    row30.cells[1].value = "LANGUAGES";
    row30.cells[1].style = PdfGridCellStyle(
      borders: emptybord,
      cellPadding: PdfPaddings(left: 0, right: 3, top: 20, bottom: 2),
      font: await getFont(GoogleFonts.workSans(), 21),
      textBrush: PdfBrushes.white,
    );
    row30.cells[0].style = PdfGridCellStyle(borders: emptybord);

    ///calculer la langueur de  grid2
    double height2 = 0;
    for (int i = 0; i < grid2.rows.count; i++) {
      height2 += grid2.rows[i].height;
    }

    ///calculer la langueur de  grid
    double height1 = 0;
    for (int i = 0; i < grid.rows.count; i++) {
      height1 += grid.rows[i].height;
    }

//Draws the grid and grid2 and grid3
    grid.draw(
        page: page,
        bounds: Rect.fromLTWH(0, 0, 200, page.getClientSize().height));
    grid2.draw(
        page: page,
        bounds: Rect.fromLTWH(
            210, ((page.getClientSize().height - height2) / 2), 0, 0));
    grid3.draw(
        page: page,
        bounds: Rect.fromLTWH(0, height1, 200, page.getClientSize().height));

//Get page graphics
    final PdfGraphics pageGraphics = page.graphics;

//Save Pdf graphics state
    final PdfGraphicsState state = pageGraphics.save();

//Create PdfPath and clip the rectangle bounds in page graphics
    final PdfPath path2 = PdfPath();
    path2.addEllipse(Rect.fromLTWH(40, 40, 130, 130));
    pageGraphics.setClip(path: path2);

    //Draw the image in page rectangle clip bounds
    if (_image != null) {
           PdfBitmap circle =
               new PdfBitmap(File(_image.path).readAsBytesSync());
           pageGraphics.drawImage(circle, const Rect.fromLTWH(40, 40, 130, 130));
    }

//Restore the graphics state
    pageGraphics.restore(state);
    //Save the document
    List<int> bytes = document.save();

    //Dispose the document
    document.dispose();
    final directory = await getExternalStorageDirectory();

//Get directory path
    final path = directory.path;

//Create an empty file to write PDF data
    File file = File('$path/Output.pdf');

//Write PDF data
    await file.writeAsBytes(bytes, flush: true);

//Open the PDF document in mobile
    OpenFile.open('$path/output.pdf');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFFfb0091).withOpacity(0.7), Color(0xFFffad87).withOpacity(0.7)]
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                child: Column(
                  children: [
                    Text(
                      "Let's make a CV!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    SizedBox(
                      height: 115,
                      width: 115,
                      child: Stack(
                        fit: StackFit.expand,
                        clipBehavior: Clip.none,
                        children: [
                          _imagePath == null
                              ? CircleAvatar(
                              backgroundImage: _image == null
                                  ? AssetImage("assets/images/avatar.png")
                                  : FileImage(File(_image.path))
                          )
                              : CircleAvatar(backgroundImage: FileImage(File(_imagePath))),
                          Positioned(
                            right: -16,
                            bottom: 0,
                            child: SizedBox(
                              height: 46,
                              width: 46,
                              child: InkWell(
                                onTap: () {
                                  _getImage();
                                  _saveImage(_image.path);
                                },
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xFFF5F6F9),
                                    border: Border.all(color: Colors.white),
                                  ),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),

                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    TextFormField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: "Enter your name",
                      ),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    TextFormField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: "Enter your occupation",
                      ),
                      onChanged: (value) {
                        setState(() {
                          job = value;
                        });
                      },
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    TextFormField(
                      cursorColor: Colors.white,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      maxLength: 200,
                      decoration: InputDecoration(
                        hintText: "Describe yourself",
                      ),
                      onChanged: (value) {
                        setState(() {
                          descri = value;
                        });
                      },
                    ),
                  ]
                )
              ),
              SizedBox(height: 40),
              Text(
                "Professional\nExperience",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: textColor),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Container(
                padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Title",
                        hintText: "Enter an experience",
                      ),
                      onChanged: (value) {
                        setState(() {
                          p_ex1 = value;
                        });
                      },
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: "Description",
                        hintText: "Describe this experience",
                      ),
                      onChanged: (value) {
                        setState(() {
                          d_ex1 = value;
                        });
                      },
                    ),
                  ]
                )
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Title",
                        hintText: "Enter your experience",
                      ),
                      onChanged: (value) {
                        setState(() {
                          p_ex2 = value;
                        });
                      },
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: "Description",
                        hintText: "Describe this experience",
                      ),
                      onChanged: (value) {
                        setState(() {
                          d_ex2 = value;
                        });
                      },
                    ),
                  ]
                )
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Title",
                        hintText: "Enter your experience",
                      ),
                      onChanged: (value) {
                        setState(() {
                          p_ex3 = value;
                        });
                      },
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: "Description",
                        hintText: "Describe this experience",
                      ),
                      onChanged: (value) {
                        setState(() {
                          d_ex3 = value;
                        });
                      },
                    ),
                  ]
                )
              ),
              SizedBox(height: 40),
              Text(
                "Education",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: textColor),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Title",
                        hintText: "Enter your experience",
                      ),
                      onChanged: (value) {
                        setState(() {
                          e_ex1 = value;
                        });
                      },
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: "Description",
                        hintText: "Describe this experience",
                      ),
                      onChanged: (value) {
                        setState(() {
                          de_ex1 = value;
                        });
                      },
                    ),
                  ]
                )
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Title",
                        hintText: "Enter your experience",
                      ),
                      onChanged: (value) {
                        setState(() {
                          e_ex2 = value;
                        });
                      },
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: "Description",
                        hintText: "Describe this experience",
                      ),
                      onChanged: (value) {
                        setState(() {
                          de_ex2 = value;
                        });
                      },
                    ),
                  ]
                )
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Title",
                        hintText: "Enter your experience",
                      ),
                      onChanged: (value) {
                        setState(() {
                          e_ex3 = value;
                        });
                      },
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: "Description",
                        hintText: "Describe this experience",
                      ),
                      onChanged: (value) {
                        setState(() {
                          de_ex3 = value;
                        });
                      },
                    ),
                  ]
                )
              ),
              SizedBox(height: 40),
              Text(
                "Extracurricular\nActivities",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: textColor),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Title",
                        hintText: "Enter an activity",
                      ),
                      onChanged: (value) {
                        setState(() {
                          h_ex1 = value;
                        });
                      },
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: "Description",
                        hintText: "Describe this activity",
                      ),
                      onChanged: (value) {
                        setState(() {
                          hd_ex1 = value;
                        });
                      },
                    ),
                  ]
                )
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Title",
                        hintText: "Enter an activity",
                      ),
                      onChanged: (value) {
                        setState(() {
                          h_ex2 = value;
                        });
                      },
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: "Description",
                        hintText: "Describe this activity",
                      ),
                      onChanged: (value) {
                        setState(() {
                          hd_ex2 = value;
                        });
                      },
                    ),
                  ],
                )
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Title",
                        hintText: "Enter an activity",
                      ),
                      onChanged: (value) {
                        setState(() {
                          h_ex3 = value;
                        });
                      },
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: "Description",
                        hintText: "Describe this activity",
                      ),
                      onChanged: (value) {
                        setState(() {
                          hd_ex3 = value;
                        });
                      },
                    ),
                  ]
                )
              ),
              SizedBox(height: 40),
              Text(
                "Languages",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: textColor),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter a language",
                          ),
                          onChanged: (value) {
                            setState(() {
                              lang1 = value;
                            });
                          },
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.02),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter a language",
                          ),
                          onChanged: (value) {
                            setState(() {
                              lang2 = value;
                            });
                          },
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.02),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter a language",
                          ),
                          onChanged: (value) {
                            setState(() {
                              lang3 = value;
                            });
                          },
                        ),
                      ]
                  )
              ),
              SizedBox(height: 40),
              Text(
                "Hobbies",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: textColor),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter a hobby",
                          ),
                          onChanged: (value) {
                            setState(() {
                              hobby1 = value;
                            });
                          },
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.02),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter a hobby",
                          ),
                          onChanged: (value) {
                            setState(() {
                              hobby2 = value;
                            });
                          },
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.02),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter a hobby",
                          ),
                          onChanged: (value) {
                            setState(() {
                              hobby3 = value;
                            });
                          },
                        ),
                      ]
                  )
              ),
              SizedBox(height: 40),
              Text(
                "Skills",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: textColor),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter a skill",
                          ),
                          onChanged: (value) {
                            setState(() {
                              comp1 = value;
                            });
                          },
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.02),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter a skill",
                          ),
                          onChanged: (value) {
                            setState(() {
                              comp2 = value;
                            });
                          },
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.02),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter a skill",
                          ),
                          onChanged: (value) {
                            setState(() {
                              comp3 = value;
                            });
                          },
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.02),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter a skill",
                          ),
                          onChanged: (value) {
                            setState(() {
                              comp4 = value;
                            });
                          },
                        ),
                      ]
                  )
              ),
              SizedBox(height: 40),
              Text(
                "Contact",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: textColor),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter your email",
                          ),
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.02),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Paste your linkedin URL",
                          ),
                          onChanged: (value) {
                            setState(() {
                              lkdin = value;
                            });
                          },
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.02),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter your phone number",
                          ),
                          onChanged: (value) {
                            setState(() {
                              tel = value;
                            });
                          },
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.02),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter your city",
                          ),
                          onChanged: (value) {
                            setState(() {
                              city = value;
                            });
                          },
                        ),
                      ]
                  )
              ),
              SizedBox(height: 40),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xFFfb0091).withOpacity(0.7), Color(0xFFffad87).withOpacity(0.7)]
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Text(
                          "Pick a color",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Container(
                                  margin: EdgeInsets.only(right: 2),
                                  padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                                  height: getProportionateScreenWidth(40),
                                  width: getProportionateScreenWidth(40),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: isSelected1 ? primaryColor : Colors.transparent),
                                    shape: BoxShape.circle,
                                  ),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFCD5C5C),
                                      shape: BoxShape.circle,
                                    ),
                                  )
                              ),
                              onTap: () {
                                setState(() {
                                  isSelected1 = !isSelected1;
                                  isSelected4 = false;
                                  isSelected2 = false;
                                  isSelected3 = false;
                                  theme = PdfBrushes.indianRed;
                                });
                              }
                            ),
                            GestureDetector(
                              child: Container(
                                  margin: EdgeInsets.only(right: 2),
                                  padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                                  height: getProportionateScreenWidth(40),
                                  width: getProportionateScreenWidth(40),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: isSelected2 ? primaryColor : Colors.transparent),
                                    shape: BoxShape.circle,
                                  ),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF008080),
                                      shape: BoxShape.circle,
                                    ),
                                  )
                              ),
                                onTap: () {
                                setState(() {
                                  isSelected2 = !isSelected2;
                                  isSelected1 = false;
                                  isSelected4 = false;
                                  isSelected3 = false;
                                  theme = PdfBrushes.teal;
                                });
                              }
                            ),
                            GestureDetector(
                              child: Container(
                                  margin: EdgeInsets.only(right: 2),
                                  padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                                  height: getProportionateScreenWidth(40),
                                  width: getProportionateScreenWidth(40),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: isSelected3 ? primaryColor : Colors.transparent),
                                    shape: BoxShape.circle,
                                  ),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF800080),
                                      shape: BoxShape.circle,
                                    ),
                                  )
                              ),
                                onTap: () {
                                setState(() {
                                  isSelected3 = !isSelected3;
                                  isSelected1 = false;
                                  isSelected2 = false;
                                  isSelected4 = false;
                                  theme = PdfBrushes.purple;
                                });
                              }
                            ),
                            GestureDetector(
                              child: Container(
                                  margin: EdgeInsets.only(right: 2),
                                  padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                                  height: getProportionateScreenWidth(40),
                                  width: getProportionateScreenWidth(40),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: isSelected4 ? primaryColor : Colors.transparent),
                                    shape: BoxShape.circle,
                                  ),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF00008B),
                                      shape: BoxShape.circle,
                                    ),
                                  )
                              ),
                                onTap: () {
                                setState(() {
                                  isSelected4 = !isSelected4;
                                  isSelected1 = false;
                                  isSelected2 = false;
                                  isSelected3 = false;
                                  theme = PdfBrushes.darkBlue;
                                });
                              }
                            )
                          ]
                        )
                      ]
                  )
              ),
              SizedBox(height: 40),
              DefaultButton(
                text: "Submit",
                press: () {
                  createPDF();
                  return Scaffold(
                    body: Center(
                        child: LoadingBouncingGrid.circle(
                          backgroundColor: primaryColor,
                        )
                    ),
                  );
                },
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
            ],
          ),
        )
      ),
    );
  }
}