'use strict';

const XLSX = require('xlsx');


var wb = XLSX.readFile('Workbook2.xlsb');

console.log(wb.Workbook.Names)