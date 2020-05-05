package com.tools;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddressList;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class ExcelUtil {

    public static File exportTemplateExcelEx(Map<String, String[]> headMap) throws IOException {
        if (headMap == null) {
            return null;
        } else {
            File tempFile = File.createTempFile(System.currentTimeMillis() + "temp", ".xlsx");
            FileOutputStream out = new FileOutputStream(tempFile);
            Throwable var3 = null;

            try {
                XSSFWorkbook workbook = new XSSFWorkbook();
                Throwable var5 = null;

                try {
                    XSSFSheet sheet = workbook.createSheet("DATA");
                    Row row = sheet.createRow(0);
                    XSSFDataValidationHelper dvHelper = new XSSFDataValidationHelper(sheet);
                    Iterator var10 = headMap.entrySet().iterator();

                    while (var10.hasNext()) {
                        Map.Entry<String, String[]> entry = (Map.Entry) var10.next();
                        String[] cellValues = (String[]) entry.getValue();
                        int cellNum = row.getPhysicalNumberOfCells();
                        Cell cell = row.createCell(cellNum);
                        cell.setCellValue((String) entry.getKey());
                        CellRangeAddressList addressList = new CellRangeAddressList(1, 1024, cellNum, cellNum);
                        if (cellValues != null && cellValues.length == 3 && "#date#".equals(cellValues[0])) {
                            DataFormat dataFormat = workbook.createDataFormat();
                            CellStyle dateCellStyle = workbook.createCellStyle();
                            dateCellStyle.setDataFormat(dataFormat.getFormat(cellValues[1]));
                            XSSFDataValidationConstraint dataValidationConstraint = (XSSFDataValidationConstraint) dvHelper.createDateConstraint(0, "date(1900,1,1)", "date(2099,12,31)", cellValues[1]);
                            XSSFDataValidation validation = (XSSFDataValidation) dvHelper.createValidation(dataValidationConstraint, addressList);
                            validation.createErrorBox("输入值日期类型有误！", "日期型，输入日期格式：" + cellValues[2]);
                            validation.setShowErrorBox(true);
                            sheet.addValidationData(validation);
                            sheet.setDefaultColumnStyle(cellNum, dateCellStyle);
                        } else if (cellValues != null) {
                            XSSFDataValidationConstraint dataValidationConstraint = (XSSFDataValidationConstraint) dvHelper.createExplicitListConstraint(cellValues);
                            XSSFDataValidation validation = (XSSFDataValidation) dvHelper.createValidation(dataValidationConstraint, addressList);
                            sheet.addValidationData(validation);
                        }
                    }

                    workbook.write(out);
                    return tempFile;
                } catch (Throwable var40) {
                    var5 = var40;
                    throw var40;
                } finally {
                    if (workbook != null) {
                        if (var5 != null) {
                            try {
                                workbook.close();
                            } catch (Throwable var39) {
                                var5.addSuppressed(var39);
                            }
                        } else {
                            workbook.close();
                        }
                    }

                }
            } catch (Throwable var42) {
                var3 = var42;
                throw var42;
            } finally {
                if (out != null) {
                    if (var3 != null) {
                        try {
                            out.close();
                        } catch (Throwable var38) {
                            var3.addSuppressed(var38);
                        }
                    } else {
                        out.close();
                    }
                }

            }
        }
    }

    /**
     * 导出工具
     *
     * @param headMap  表格头<字段名 ， 显示名 >
     * @param dataList 数据
     */
    public static File exportExcel(Map<String, String> headMap, List<?> dataList) throws IOException {
        if (headMap == null) {
            return null;
        }
        File tempFile = File.createTempFile(System.currentTimeMillis() + "temp", ".xlsx");
        try (FileOutputStream out = new FileOutputStream(tempFile); SXSSFWorkbook workbook = new SXSSFWorkbook(10000);) {
            String sheetName = "DATA";
            // 第一个sheet
            writeSheet(workbook, sheetName, headMap, dataList);
            workbook.write(out);
        }
        return tempFile;
    }

    public static void writeSheet(SXSSFWorkbook workbook, String sheetName, Map<String, String> headMap, List<?> dataList) throws IOException {
        if (workbook == null || headMap == null) {
            return;
        }
        Sheet sheet = workbook.createSheet(sheetName);
        // head
        writeHead(sheet, headMap);
        // body
        writeBody(sheet, headMap, dataList);
    }

    private static void writeHead(Sheet sheet, Map<String, String> headMap) {
        Row row = sheet.createRow(0);
        for (Map.Entry<String, String> entry : headMap.entrySet()) {
            String cellValue = entry.getValue();
            Cell cell = row.createCell(row.getPhysicalNumberOfCells());
            cell.setCellValue(cellValue);
        }
    }

    private static void writeBody(Sheet sheet, Map<String, String> headMap, List<?> dataList) throws IOException {
        if (dataList != null) {
            // 用来绘制图片
            Drawing drawing = sheet.createDrawingPatriarch();
            Row row = null;
            Cell cell = null;
            String cellValue = null;
            for (Object data : dataList) {
                if (data == null) {
                    continue;
                }
                row = sheet.createRow(sheet.getLastRowNum() + 1);
                for (String headKey : headMap.keySet()) {
                    // 获得新的CELL
                    cell = row.createCell(row.getPhysicalNumberOfCells());
                    // 支持在导出模板头中 配置 时间格式。
                    String sdf = null;
                    if (headKey.indexOf("&FMT&") >= 0) {
                        String[] arrTemp = headKey.split("&FMT&");
                        headKey = arrTemp[0];
                        sdf = arrTemp.length > 1 ? arrTemp[1] : null;
                    }
                    // 设置CELL的值
                    Object returnValue = getObjectFieldValue(headKey, data);

                    if (!sdf.isEmpty() && returnValue != null) {
                        SimpleDateFormat simpDateFormat = new SimpleDateFormat(sdf);
                        cellValue = simpDateFormat.format(returnValue);
                    } else {
                        // 不包含日期格式化信息的直接得到字符串
                        cellValue = toString(returnValue);
                    }

                    if (returnValue != null && returnValue instanceof Number) {
                        Number nValue = (Number) returnValue;
                        cell.setCellValue(nValue.doubleValue());
                        cell.setCellType(XSSFCell.CELL_TYPE_NUMERIC);
                    }  else {
                        cell.setCellValue(cellValue);
                        cell.setCellType(XSSFCell.CELL_TYPE_STRING);
                    }

                }
            }
        }
    }

    public static String toString(Object o) {
        String s = "";
        if (o != null) {
            if (o instanceof Date) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                s = sdf.format((Date) o);
            } else if (o instanceof Boolean) {
                s = (Boolean) o ? "是" : "否";
            } else if (o instanceof Number) {
                Number n = (Number) o;
                s = n.toString();
            } else if (o instanceof BigDecimal) {
                DecimalFormat df = new DecimalFormat("#.00");
                s = df.format(o);
            } else {
                s = o.toString();
            }
        }
        return s;
    }

    private static Object getObjectFieldValue(String dataFieldName, Object data) {
        Object returnValue = null;
        try {
            String fieldName = dataFieldName;
            String[] fieldNames = fieldName.split("\\.");
            // 支持二级类
            if (fieldNames.length == 2) {
                fieldName = fieldNames[0];
                fieldName = fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
                Object tempReturnValue = data.getClass().getMethod("get" + fieldName).invoke(data);
                fieldName = fieldNames[1];
                fieldName = fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
                Method m = tempReturnValue.getClass().getMethod("get" + fieldName);
                returnValue = m.invoke(tempReturnValue);
            } else {
                fieldName = fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
                Method m = data.getClass().getMethod("get" + fieldName);
                returnValue = m.invoke(data);
            }
        } catch (Exception re) {
            re.printStackTrace();
        }
        return returnValue;
    }

    public static <T> List<T> readExcel(String src, Map<String, String> headMap, Class<T> classz) {
        return readExcel(src, headMap, classz, 0, (String) null);
    }

    public static <T> List<T> readExcel(String src, Map<String, String> headMap, Class<T> classz, int column, String datePattern) {
        if (!src.endsWith("xls") && !src.endsWith("xlsx")) {
            throw new IllegalArgumentException(src + " 无效文件！");
        } else {
            List<T> result = new ArrayList();
            Object workbook = null;

            Object row = new Object();
            try {
                FileInputStream srcInputStream = new FileInputStream(src);
                Throwable var8 = null;

                try {
                    if (src.endsWith("xls")) {
                        POIFSFileSystem poifsFileSystem = new POIFSFileSystem(srcInputStream);
                        workbook = new HSSFWorkbook(poifsFileSystem);
                    } else if (src.endsWith("xlsx")) {
                        workbook = new XSSFWorkbook(new File(src));
                    }

                    Sheet sheet = ((Workbook) workbook).getSheetAt(0);
                    if (sheet != null) {
                        row = sheet.getRow(0);
                        Map<Integer, String> fieldNameColumnMap = new HashMap();

                        int rowNum;
                        for (rowNum = column; rowNum < ((Row) row).getPhysicalNumberOfCells(); ++rowNum) {
                            Cell cell = ((Row) row).getCell(rowNum);
                            cell.setCellType(1);
                            String cellValue = cell.getStringCellValue();
                            if (!cellValue.isEmpty() && headMap.get(cellValue) != null) {
                                fieldNameColumnMap.put(rowNum, headMap.get(cellValue));
                            }
                        }
                        int totalRow = sheet.getLastRowNum();

                        for (rowNum = 1; rowNum <= totalRow; ++rowNum) {
                            row = sheet.getRow(rowNum);
                            if (row != null) {
                                T item = classz.newInstance();
                                Boolean hasData = false;
                                Iterator var16 = fieldNameColumnMap.entrySet().iterator();

                                while (var16.hasNext()) {
                                    Map.Entry<Integer, String> entry = (Map.Entry) var16.next();
                                    if (entry.getValue() != null) {
                                        String value = readCellValueEx((Row) row, item, (Integer) entry.getKey(), (String) entry.getValue(), true);
                                        if (value != null && !value.trim().equals("")) {
                                            setObjectProperty(item, (String) entry.getValue(), value, datePattern);
                                            hasData = true;
                                        }
                                    }
                                }

                                if (hasData) {
                                    result.add(item);
                                }
                            }
                        }

                        return result;
                    }

                    row = result;
                } catch (Throwable var43) {
                    var8 = var43;
                    throw var43;
                } finally {
                    if (srcInputStream != null) {
                        if (var8 != null) {
                            try {
                                srcInputStream.close();
                            } catch (Throwable var42) {
                                var8.addSuppressed(var42);
                            }
                        } else {
                            srcInputStream.close();
                        }
                    }

                }
            } catch (IllegalAccessException | IOException | InvalidFormatException | InstantiationException var45) {
                var45.printStackTrace();
            } finally {
                try {
                    ((Workbook) workbook).close();
                } catch (IOException var41) {
                    var41.printStackTrace();
                }

            }

            return (List) row;
        }
    }

    private static <T> String readCellValueEx(Row row, T object, int index, String fieldName, boolean nullable) {
        String val = null;
        Cell cell = row.getCell(index);
        if (cell != null) {
            if (cell.getCellType() == 0) {
                double num = cell.getNumericCellValue();
                if (HSSFDateUtil.isCellDateFormatted(cell)) {
                    Date date = HSSFDateUtil.getJavaDate(num);
                    Field field = null;
                    String dateTimeFormat = "yyyy-MM-dd HH:mm:ss";

                    try {
                        field = getClassField(object.getClass(), fieldName);
                        String typeName = field.getType().getName().toLowerCase();
                        if (typeName.endsWith("date")) {
                            DateTimeFormat format = (DateTimeFormat) field.getAnnotation(DateTimeFormat.class);
                            if (format != null) {
                                dateTimeFormat = format.pattern();
                            }
                        }
                    } catch (Exception var14) {
                        var14.printStackTrace();
                    }

                    SimpleDateFormat sdf = new SimpleDateFormat(dateTimeFormat);
                    val = sdf.format(date);
                } else {
                    BigDecimal bigDecimal = BigDecimal.valueOf(num);
                    val = bigDecimal.toPlainString();
                    if (val.endsWith(".0")) {
                        val = val.replaceAll("\\.0$", "");
                    }
                }
            } else if (cell.getCellType() == 1) {
                val = cell.getStringCellValue();
            }
        }
        return val;

    }

    private static void setObjectProperty(Object object, String fieldName, String value, String datePattern) {
        Field field = null;

        try {
            field = getClassField(object.getClass(), fieldName);
            String fieldTypeName = field.getType().getName().toLowerCase();
            BeanUtils.setProperty(object, fieldName, value);
        } catch (SecurityException | IllegalArgumentException | IllegalAccessException | InvocationTargetException | NoSuchFieldException var9) {
            var9.printStackTrace();
        }

    }

    private static Field getClassField(Class object, String fieldName) throws NoSuchFieldException {
        Field field = null;

        try {
            field = object.getDeclaredField(fieldName);
        } catch (SecurityException | NoSuchFieldException var4) {
        }

        if (field == null) {
            Class superClass = object.getSuperclass();
            if (superClass == null) {
                throw new NoSuchFieldException();
            }

            field = getClassField(superClass, fieldName);
        }

        if (field != null) {
            field.setAccessible(true);
            return field;
        } else {
            throw new NoSuchFieldException();
        }
    }
}
