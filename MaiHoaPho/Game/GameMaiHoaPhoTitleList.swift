//
//  GameTitleList.swift
//  MaiHoaPho
//
//  Created by ngoctam on 9/16/18.
//  Copyright © 2018 ngoctam. All rights reserved.
//

import Foundation

// It can be updated to load data from iCloud in the later versions

class GameMaiHoaPhoTitleList {
    
    private static var mTreeLevel = 3
    // There are 3 levels
    // 1. Chapter
    // 2. Sub-chapter
    // 3. part
    
    static var TreeLevel: Int{
        get {
            return mTreeLevel
        }
    }
    
    private static var mInternalIndex = 0
    private static var _resetRequest = false
    static var ResetRequest: Bool{
        get {
            return self._resetRequest
        }
    }
    
    private static var _lastTitleRow = 0
    static var lastTitleRow:Int{
        get{
            return self._lastTitleRow
        }
        set(newvalue){
            /*if newvalue >= msubSectionNumbers[_lastTitleSection]{
                self._lastTitleRow = msubSectionNumbers[_lastTitleSection] - 1
            }
            else{
                self._lastTitleRow = newvalue
            }
            */
            self._lastTitleRow = newvalue
        }
    }
    
    private static var _lastTitleSection = 0
    static var lastTitleSection:Int{
        get{
            return self._lastTitleSection
        }
        set(newvalue){
            if newvalue >= msubSectionName.count{
                self._lastTitleSection = msubSectionName.count - 1
            }
            else
            {
                self._lastTitleSection = newvalue
            }
        }
    }
    
    static var InternalIndex: Int {
        get {
            return self.mInternalIndex
        }
        set (newvalue){
            if mInternalIndex != newvalue{
                _resetRequest = true
            }
            
            if newvalue >= mFileName.count{
                mInternalIndex = mFileName.count - 1
            }
            else if newvalue < 0{
                mInternalIndex = 0
            }
            else{
                mInternalIndex = newvalue
            }
        }
    }
    
    private static let mSectionNames = [
        "Bình phong mã phá Đương đầu pháo",
        "Đương Đầu Pháo Phá Quá Cung Pháo",
        "Đương Đầu Pháo Phá Chuyển Giác Mã",
        "Thuận thủ pháo trực Xa công hoành Xa",
        "Thuận thủ pháo hoành Xa công trực Xa",
        "Đương đầu pháo đối Liệt thủ pháo",
    ]
    
    private static let mSectionNumbers = [
        8,
        4,
        3,
        4,
        5,
        5,
    ]
    
    private static let msubSectionName = [
        "Phá Xe Tuần Hà Ăn Tốt Bắt Tượng",
        "Phá Pháo Ăn Tượng Sau Đó Lên Mã Lộ 3",
        "Phá Pháo Bắt Tượng Đổi Sĩ Mã Bên Phải",
        "Thoái Pháo Phá Xe Tuần Hà Tiến Tốt Đổi Tốt",
        "Thoái Pháo Hoành Xa Phá Tuần Hà Xa Biên Mã",
        "Thoái Pháo Phá Xe Vượt Hà Ăn Tốt",
        "Lên Tượng Tiến Mã Phá Quá Hà Xa Biên Mã",
        "Tiến Mã Tiến Tam Binh Phá Trực Hoành Xa Biên Mã", // 8 - "Bình phong mã phá Đương đầu pháo"
        // "Xe Hoành Phá Tuần Hà Xa Bình 7 Ăn Tốt" // Missing from database
        "Xe Hoành Phá Pháo Trái Bình Lộ 7 Bắt Mã",
        "Hoành Xa Giáp Mã Phá Quá Cung Pháo",
        "Lên Xe Thoái Pháo Phá Pháo 8 Qua Hà",
        "Lên Xe Phá Xe Qua Hà Ăn Tốt Đè Mã", // 4 - Đương Đầu Pháo Phá Quá Cung Pháo
        "Bắt Tốt Đầu Đè Mã Phá Lên Sĩ Phải",
        "Bắt Tốt Đầu Đè Mã Phá Lên Sĩ Trái Đổi Pháo",
        "Bắt Tốt Đầu Đè Mã Phá Lên Sĩ Trái Bình Pháo", // 3 - Đương Đầu Pháo Phá Chuyển Giác Mã
        "Tuần Hà Pháo Công Hoành Xa",
        "Tuần Hà Pháo Công Hoành Xa Thoái Rồi Tiến",
        "Tuần Hà Pháo Công Hoành Xa Kỵ Hà Chặn Pháo",
        "Tuần Hà Pháo Công Hoành Xa Tái Đĩnh Biên Binh", // 4 - Thuận Thủ Pháo Trực Xa Công Hoành Xa
        "Công Trực Xa Quá Hà Áp Mã Sĩ Giác Pháo",
        "Công Trực Xa Thủ Hà Khẩu Đỉnh Binh Đoái Tốt",
        "Công Trực Xa Thủ Hà Tái Bổ Sĩ Giác Pháo",
        "Tốt Biên Mã Biên Công Lên Sĩ Trái",
        "Pháo Trái Qua Hà Công Lên Mã Biên Ra Xe", // 5 - Thuận Thủ Pháo Hoành Xa Công TrựcXa
        "Tuần Hà Xa Công Xa Thủ Hà Khẩu Đoái Tốt",
        "Công Xe Phải Thủ Hà Sau Lên Mã Bắt Xe",
        "Công Xe Phải Thủ Hà Sau Bình Pháo Đổi Xe",
        "Công Xe Phải Qua Hà Sau Bình Xe Đổi Pháo",
        "Công Tiến Xe Phải Bình Pháo Đổi Xe" // 5 - Đương Đầu Pháo Đối Liệt Thủ Pháo
    ]
    
    private static let msubSectionNumbers = [
        13,                     // "Phá Xe Tuần Hà Ăn Tốt Bắt Tượng",
        10,                     // "Phá Pháo Ăn Tượng Sau Đó Lên Mã Lộ 3",
        15,                     // "Phá Pháo Bắt Tượng Đổi Sĩ Mã Bên Phải",
        22,                     // "Thoái Pháo Phá Xe Tuần Hà Tiến Tốt Đổi Tốt",
        28,                     // "Thoái Pháo Hoành Xa Phá Tuần Hà Xa Biên Mã",
        6,                      // "Thoái Pháo Phá Xe Vượt Hà Ăn Tốt",
        6,                      // "Lên Tượng Tiến Mã Phá Quá Hà Xa Biên Mã"
        9,                      // "Tiến Mã Tiến Tam Binh Phá Trực Hoành Xa Biên Mã",       // 109 - Bình phong mã phá Đương đầu pháo
        16,                     // "Xe Hoành Phá Pháo Trái Bình Lộ 7 Bắt Mã",
        13,                     // "Hoành Xa Giáp Mã Phá Quá Cung Pháo",
        21,                     // "Lên Xe Thoái Pháo Phá Pháo 8 Qua Hà",
        19,                     // "Lên Xe Phá Xe Qua Hà Ăn Tốt Đè Mã",                   // 178 - Đương Đầu Pháo Phá Quá Cung Pháo
        5,                      // "Bắt Tốt Đầu Đè Mã Phá Lên Sĩ Phải",
        7,                      // "Bắt Tốt Đầu Đè Mã Phá Lên Sĩ Trái Đổi Pháo",
        7,                      // "Bắt Tốt Đầu Đè Mã Phá Lên Sĩ Trái Bình Pháo",        // 197 - Đương Đầu Pháo Phá Chuyển Giác Mã
        11,                     // "Tuần Hà Pháo Công Hoành Xa",
        5,                      // "Tuần Hà Pháo Công Hoành Xa Thoái Rồi Tiến",
        6,                      // "Tuần Hà Pháo Công Hoành Xa Kỵ Hà Chặn Pháo",
        11,                     // "Tuần Hà Pháo Công Hoành Xa Tái Đĩnh Biên Binh"       // 230 - Thuận Thủ Pháo Trực Xa Công Hoành Xa
        11,                     // "Công Trực Xa Quá Hà Áp Mã Sĩ Giác Pháo"
        7,                      // "Công Trực Xa Thủ Hà Khẩu Đỉnh Binh Đoái Tốt"
        16,                      // "Công Trực Xa Thủ Hà Tái Bổ Sĩ Giác Pháo"
        7,                       // "Tốt Biên Mã Biên Công Lên Sĩ Trái"
        7,                       // "Pháo Trái Qua Hà Công Lên Mã Biên Ra Xe"           // 278 - Thuận Thủ Pháo Hoành Xa Công TrựcXa
        11,                     // "Tuần Hà Xa Công Xa Thủ Hà Khẩu Đoái Tốt"
        4,                      // "Công Xe Phải Thủ Hà Sau Lên Mã Bắt Xe"
        13,                      // "Công Xe Phải Thủ Hà Sau Bình Pháo Đổi Xe"
        6,                       // "Công Xe Phải Qua Hà Sau Bình Xe Đổi Pháo"
        21,                      // "Công Tiến Xe Phải Bình Pháo Đổi Xe"
    ]
    
    static var subSectionNumbers: [Int]{
        get{
            return self.msubSectionNumbers
        }
    }
    
    static var subSectionName:[String]{
        get{
            return self.msubSectionName
        }
    }
    
    static var SectionNumbers: [Int]{
        get{
            return self.mSectionNumbers
        }
    }
    
    static var SectionName:[String]{
        get{
            return self.mSectionNames
        }
    }
    
    
    private static let mFileName = [
        "pha_xe_tuan_ha_an_tot_bat_tuong_p1",
        "pha_xe_tuan_ha_an_tot_bat_tuong_p2",
        "pha_xe_tuan_ha_an_tot_bat_tuong_part4",
        "pha_xe_tuan_ha_an_tot_bat_tuong_part5",
        "pha_xe_tuan_ha_an_tot_bat_tuong_part6",
        "pha_xe_tuan_ha_an_tot_bat_tuong_part7",
        "pha_xe_tuan_ha_an_tot_bat_tuong_part8",
        "pha_xe_tuan_ha_an_tot_bat_tuong_part9",
        "pha_xe_tuan_ha_an_tot_bat_tuong_part10",
        "pha_xe_tuan_ha_an_tot_bat_tuong_part11",
        "pha_xe_tuan_ha_an_tot_bat_tuong_part12",
        "pha_xe_tuan_ha_an_tot_bat_tuong_part13",
        "pha_xe_tuan_ha_an_tot_bat_tuong_part14",   // 13
        "pha_phao_an_tuong_sau_do_len_ma_lo_ba_part1",
        "pha_phao_an_tuong_sau_do_len_ma_lo_ba_part2",
        "pha_phao_an_tuong_sau_do_len_ma_lo_ba_part5",
        "pha_phao_an_tuong_sau_do_len_ma_lo_ba_part6",
        "pha_phao_an_tuong_sau_do_len_ma_lo_ba_part7",
        "pha_phao_an_tuong_sau_do_len_ma_lo_ba_part8",
        "pha_phao_an_tuong_sau_do_len_ma_lo_ba_part9",
        "pha_phao_an_tuong_sau_do_len_ma_lo_ba_part11",
        "pha_phao_an_tuong_sau_do_len_ma_lo_ba_part12",
        "pha_phao_an_tuong_sau_do_len_ma_lo_ba_part13",// 10 -> 23
        "pha_phao_bat_tuong_doi_si_ma_ben_phai_part1",
        "pha_phao_bat_tuong_doi_si_ma_ben_phai_part2",
        "pha_phao_bat_tuong_doi_si_ma_ben_phai_part3",
        "pha_phao_bat_tuong_doi_si_ma_ben_phai_part4",
        "pha_phao_bat_tuong_doi_si_ma_ben_phai_part5",
        "pha_phao_bat_tuong_doi_si_ma_ben_phai_part6",
        "pha_phao_bat_tuong_doi_si_ma_ben_phai_part7",
        "pha_phao_bat_tuong_doi_si_ma_ben_phai_part8",
        "pha_phao_bat_tuong_doi_si_ma_ben_phai_part9",
        "pha_phao_bat_tuong_doi_si_ma_ben_phai_part11",
        "pha_phao_bat_tuong_doi_si_ma_ben_phai_part12",
        "pha_phao_bat_tuong_doi_si_ma_ben_phai_part13",
        "pha_phao_bat_tuong_doi_si_ma_ben_phai_part14",
        "pha_phao_bat_tuong_doi_si_ma_ben_phai_part15",
        "pha_phao_bat_tuong_doi_si_ma_ben_phai_part16",     // 15 -> 38
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part1",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part2",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part3",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part4",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part5",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part6",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part7",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part8",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part9",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part10",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part11",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part12",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part13",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part14",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part16",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part17",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part18",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part19",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part20",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part22",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part23",
        "thoai_phao_pha_xe_tuan_ha_tien_tot_doi_tot_part24", // 22 -> 60
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part1",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part2",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part3",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part4",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part6",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part7",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part8",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part9",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part10",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part11",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part12",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part13",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part14",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part15",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part16",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part17",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part18",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part20",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part21",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part22",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part24",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part25",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part26",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part27",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part28",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part30",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part31",
        "thoai_phao_hoanh_xa_pha_tuan_ha_xa_bien_ma_part33", // 28 -> 88
        "thoai_phao_pha_xe_vuot_ha_an_tot_part2",
        "thoai_phao_pha_xe_vuot_ha_an_tot_part3",
        "thoai_phao_pha_xe_vuot_ha_an_tot_part5",
        "thoai_phao_pha_xe_vuot_ha_an_tot_part7",
        "thoai_phao_pha_xe_vuot_ha_an_tot_part8",
        "thoai_phao_pha_xe_vuot_ha_an_tot_part9",            // 6 -> 94
        "len_tuong_tien_ma_pha_qua_ha_xa_bien_ma_p1",
        "len_tuong_tien_ma_pha_qua_ha_xa_bien_ma_p2",
        "len_tuong_tien_ma_pha_qua_ha_xa_bien_ma_p3",
        "len_tuong_tien_ma_pha_qua_ha_xa_bien_ma_p4",
        "len_tuong_tien_ma_pha_qua_ha_xa_bien_ma_p5",
        "len_tuong_tien_ma_pha_qua_ha_xa_bien_ma_p6",        // 6 -> 100
        "tien_ma_tien_tam_binh_pha_truc_hoanh_xa_bien_ma_p1",
        "tien_ma_tien_tam_binh_pha_truc_hoanh_xa_bien_ma_p2",
        "tien_ma_tien_tam_binh_pha_truc_hoanh_xa_bien_ma_p4",
        "tien_ma_tien_tam_binh_pha_truc_hoanh_xa_bien_ma_p5",
        "tien_ma_tien_tam_binh_pha_truc_hoanh_xa_bien_ma_p6",
        "tien_ma_tien_tam_binh_pha_truc_hoanh_xa_bien_ma_p7",
        "tien_ma_tien_tam_binh_pha_truc_hoanh_xa_bien_ma_p8",
        "tien_ma_tien_tam_binh_pha_truc_hoanh_xa_bien_ma_p9",
        "tien_ma_tien_tam_binh_pha_truc_hoanh_xa_bien_ma_p10", // 9 -> 109
        "xe_hoanh_pha_tuan_ha_xa_binh_7_bat_ma_p1",
        "xe_hoanh_pha_tuan_ha_xa_binh_7_bat_ma_p2",
        "xe_hoanh_pha_tuan_ha_xa_binh_7_bat_ma_p3",
        "xe_hoanh_pha_tuan_ha_xa_binh_7_bat_ma_p5",
        "xe_hoanh_pha_tuan_ha_xa_binh_7_bat_ma_p6",
        "xe_hoanh_pha_tuan_ha_xa_binh_7_bat_ma_p7",
        "xe_hoanh_pha_tuan_ha_xa_binh_7_bat_ma_p9",
        "xe_hoanh_pha_tuan_ha_xa_binh_7_bat_ma_p10",
        "xe_hoanh_pha_tuan_ha_xa_binh_7_bat_ma_p11",
        "xe_hoanh_pha_tuan_ha_xa_binh_7_bat_ma_p12",
        "xe_hoanh_pha_tuan_ha_xa_binh_7_bat_ma_p13",
        "xe_hoanh_pha_tuan_ha_xa_binh_7_bat_ma_p14",
        "xe_hoanh_pha_tuan_ha_xa_binh_7_bat_ma_p15",
        "xe_hoanh_pha_tuan_ha_xa_binh_7_bat_ma_p17",
        "xe_hoanh_pha_tuan_ha_xa_binh_7_bat_ma_p18",
        "xe_hoanh_pha_tuan_ha_xa_binh_7_bat_ma_p19", // 16  -> 125
        "hoanh_xa_giap_ma_pha_qua_cung_phap_p1",
        "hoanh_xa_giap_ma_pha_qua_cung_phap_p2",
        "hoanh_xa_giap_ma_pha_qua_cung_phap_p3",
        "hoanh_xa_giap_ma_pha_qua_cung_phap_p4",
        "hoanh_xa_giap_ma_pha_qua_cung_phap_p5",
        "hoanh_xa_giap_ma_pha_qua_cung_phap_p6",
        "hoanh_xa_giap_ma_pha_qua_cung_phap_p8",
        "hoanh_xa_giap_ma_pha_qua_cung_phap_p9",
        "hoanh_xa_giap_ma_pha_qua_cung_phap_p10",
        "hoanh_xa_giap_ma_pha_qua_cung_phap_p11",
        "hoanh_xa_giap_ma_pha_qua_cung_phap_p12",
        "hoanh_xa_giap_ma_pha_qua_cung_phap_p13",
        "hoanh_xa_giap_ma_pha_qua_cung_phap_p14",  // 13 -> 138
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p1",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p2",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p3",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p4",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p5",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p6",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p7",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p8",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p9",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p10",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p11",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p12",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p13",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p14",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p15",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p16",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p17",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p18",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p19",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p20",
        "len_xe_thoai_phao_pha_phao_8_qua_ha_p21", // 21 -> 159
        "len_xe_pha_xe_qua_ha_an_to_de_ma_part1",
        "len_xe_pha_xe_qua_ha_an_to_de_ma_part2",
        "len_xe_pha_xe_qua_ha_an_to_de_ma_part3",
        "len_xe_pha_xe_qua_ha_an_to_de_ma_part4",
        "len_xe_pha_xe_qua_ha_an_to_de_ma_part5",
        "len_xe_pha_xe_qua_ha_an_to_de_ma_part6",
        "len_xe_pha_xe_qua_ha_an_to_de_ma_part7",
        "len_xe_pha_xe_qua_ha_an_to_de_ma_part8",
        "len_xe_pha_xe_qua_ha_an_to_de_ma_part10",
        "len_xe_pha_xe_qua_ha_an_to_de_ma_part11",
        "len_xe_pha_xe_qua_ha_an_to_de_ma_part12",
        "len_xe_pha_xe_qua_ha_an_to_de_ma_part13",
        "len_xe_pha_xe_qua_ha_an_to_de_ma_part14",
        "len_xe_pha_xe_qua_ha_an_to_de_ma_part15",
        "len_xe_pha_xe_qua_ha_an_to_de_ma_part16",
        "len_xe_pha_xe_qua_ha_an_to_de_ma_part17",
        "len_xe_pha_xe_qua_ha_an_to_de_ma_part20",
        "len_xe_pha_xe_qua_ha_an_to_de_ma_part21",
        "len_xe_pha_xe_qua_ha_an_to_de_ma_part22",  // 19 -> 178
        "bat_tot_dau_de_ma_pha_len_si_phai_part1",
        "bat_tot_dau_de_ma_pha_len_si_phai_part2",
        "bat_tot_dau_de_ma_pha_len_si_phai_part3",
        "bat_tot_dau_de_ma_pha_len_si_phai_part5",
        "bat_tot_dau_de_ma_pha_len_si_phai_part6",  // 5 -> 183
        "bat_tot_dau_de_ma_pha_len_si_trai_doi_phao_part1",
        "bat_tot_dau_de_ma_pha_len_si_trai_doi_phao_part2",
        "bat_tot_dau_de_ma_pha_len_si_trai_doi_phao_part3",
        "bat_tot_dau_de_ma_pha_len_si_trai_doi_phao_part4",
        "bat_tot_dau_de_ma_pha_len_si_trai_doi_phao_part5",
        "bat_tot_dau_de_ma_pha_len_si_trai_doi_phao_part6",
        "bat_tot_dau_de_ma_pha_len_si_trai_doi_phao_part7", // 7 -> 190
        "bat_tot_dau_de_ma_pha_len_si_trai_binh_phao_part1",
        "bat_tot_dau_de_ma_pha_len_si_trai_binh_phao_part2",
        "bat_tot_dau_de_ma_pha_len_si_trai_binh_phao_part3",
        "bat_tot_dau_de_ma_pha_len_si_trai_binh_phao_part4",
        "bat_tot_dau_de_ma_pha_len_si_trai_binh_phao_part5",
        "bat_tot_dau_de_ma_pha_len_si_trai_binh_phao_part7",
        "bat_tot_dau_de_ma_pha_len_si_trai_binh_phao_part8", // 7 -> 197
        "tuan_ha_phao_cong_hoanh_xa_part1",
        "tuan_ha_phao_cong_hoanh_xa_part2",
        "tuan_ha_phao_cong_hoanh_xa_part3",
        "tuan_ha_phao_cong_hoanh_xa_part5",
        "tuan_ha_phao_cong_hoanh_xa_part6",
        "tuan_ha_phao_cong_hoanh_xa_part7",
        "tuan_ha_phao_cong_hoanh_xa_part8",
        "tuan_ha_phao_cong_hoanh_xa_part9",
        "tuan_ha_phao_cong_hoanh_xa_part10",
        "tuan_ha_phao_cong_hoanh_xa_part11",
        "tuan_ha_phao_cong_hoanh_xa_part12", // 11 -> 208
        "tuan_ha_phao_cong_hoanh_xa_thoai_roi_tien_part1",
        "tuan_ha_phao_cong_hoanh_xa_thoai_roi_tien_part2",
        "tuan_ha_phao_cong_hoanh_xa_thoai_roi_tien_part3",
        "tuan_ha_phao_cong_hoanh_xa_thoai_roi_tien_part4",
        "tuan_ha_phao_cong_hoanh_xa_thoai_roi_tien_part5", // 5 -> 213
        "tuan_ha_phao_cong_hoanh_xa_ky_ha_chan_phao_p1",
        "tuan_ha_phao_cong_hoanh_xa_ky_ha_chan_phao_p2",
        "tuan_ha_phao_cong_hoanh_xa_ky_ha_chan_phao_p3",
        "tuan_ha_phao_cong_hoanh_xa_ky_ha_chan_phao_p5",
        "tuan_ha_phao_cong_hoanh_xa_ky_ha_chan_phao_p6",
        "tuan_ha_phao_cong_hoanh_xa_ky_ha_chan_phao_p8", // 6 -> 219
        "tuan_ha_phao_cong_hoanh_xa_tai_dinh_bien_binh_p1",
        "tuan_ha_phao_cong_hoanh_xa_tai_dinh_bien_binh_p2", // Version 1
        "tuan_ha_phao_cong_hoanh_xa_tai_dinh_bien_binh_p3",
        "tuan_ha_phao_cong_hoanh_xa_tai_dinh_bien_binh_p4",
        "tuan_ha_phao_cong_hoanh_xa_tai_dinh_bien_binh_p5",
        "tuan_ha_phao_cong_hoanh_xa_tai_dinh_bien_binh_p6",
        "tuan_ha_phao_cong_hoanh_xa_tai_dinh_bien_binh_p7",
        "tuan_ha_phao_cong_hoanh_xa_tai_dinh_bien_binh_p8",
        "tuan_ha_phao_cong_hoanh_xa_tai_dinh_bien_binh_p9",
        "tuan_ha_phao_cong_hoanh_xa_tai_dinh_bien_binh_p10",
        "tuan_ha_phao_cong_hoanh_xa_tai_dinh_bien_binh_p11", // 11 -> 230
        "cong_truc_xa_qua_ha_ap_ma_si_giac_phao_p1",
        "cong_truc_xa_qua_ha_ap_ma_si_giac_phao_p2" ,   // not ok
        "cong_truc_xa_qua_ha_ap_ma_si_giac_phao_p3" ,
        "cong_truc_xa_qua_ha_ap_ma_si_giac_phao_p4" ,
        "cong_truc_xa_qua_ha_ap_ma_si_giac_phao_p5" ,   
        "cong_truc_xa_qua_ha_ap_ma_si_giac_phao_p6" ,
        "cong_truc_xa_qua_ha_ap_ma_si_giac_phao_p7" ,
        "cong_truc_xa_qua_ha_ap_ma_si_giac_phao_p8" ,
        "cong_truc_xa_qua_ha_ap_ma_si_giac_phao_p9" ,
        "cong_truc_xa_qua_ha_ap_ma_si_giac_phao_p10",
        "cong_truc_xa_qua_ha_ap_ma_si_giac_phao_p11",     // 11 -> 241
        "cong_truc_xa_thu_ha_khau_dinh_binh_doai_tot_p1",
        "cong_truc_xa_thu_ha_khau_dinh_binh_doai_tot_p2",
        "cong_truc_xa_thu_ha_khau_dinh_binh_doai_tot_p3",
        "cong_truc_xa_thu_ha_khau_dinh_binh_doai_tot_p4",
        "cong_truc_xa_thu_ha_khau_dinh_binh_doai_tot_p5",
        "cong_truc_xa_thu_ha_khau_dinh_binh_doai_tot_p6",
        "cong_truc_xa_thu_ha_khau_dinh_binh_doai_tot_p7",    // 7 -> 248
        "cong_truc_xa_thu_ha_tai_bo_si_giac_phao_p1",
        "cong_truc_xa_thu_ha_tai_bo_si_giac_phao_p2",
        "cong_truc_xa_thu_ha_tai_bo_si_giac_phao_p3",
        "cong_truc_xa_thu_ha_tai_bo_si_giac_phao_p4",
        "cong_truc_xa_thu_ha_tai_bo_si_giac_phao_p5",
        "cong_truc_xa_thu_ha_tai_bo_si_giac_phao_p6",
        "cong_truc_xa_thu_ha_tai_bo_si_giac_phao_p7",
        "cong_truc_xa_thu_ha_tai_bo_si_giac_phao_p8",
        "cong_truc_xa_thu_ha_tai_bo_si_giac_phao_p9",
        "cong_truc_xa_thu_ha_tai_bo_si_giac_phao_p10",
        "cong_truc_xa_thu_ha_tai_bo_si_giac_phao_p11",
        "cong_truc_xa_thu_ha_tai_bo_si_giac_phao_p12",
        "cong_truc_xa_thu_ha_tai_bo_si_giac_phao_p13",
        "cong_truc_xa_thu_ha_tai_bo_si_giac_phao_p14",
        "cong_truc_xa_thu_ha_tai_bo_si_giac_phao_p15",
        "cong_truc_xa_thu_ha_tai_bo_si_giac_phao_p16",           // 16 -> 264
        "tot_bien_ma_bien_cong_len_si_trai_p1",
        "tot_bien_ma_bien_cong_len_si_trai_p2", 
        "tot_bien_ma_bien_cong_len_si_trai_p3",
        "tot_bien_ma_bien_cong_len_si_trai_p4",
        "tot_bien_ma_bien_cong_len_si_trai_p5",
        "tot_bien_ma_bien_cong_len_si_trai_p6",
        "tot_bien_ma_bien_cong_len_si_trai_p7",                  // 7 -> 271
        "phao_trai_qua_ha_cong_len_ma_bien_ra_xe_p1",
        "phao_trai_qua_ha_cong_len_ma_bien_ra_xe_p2",
        "phao_trai_qua_ha_cong_len_ma_bien_ra_xe_p3",           // Tested
        "phao_trai_qua_ha_cong_len_ma_bien_ra_xe_p4",
        "phao_trai_qua_ha_cong_len_ma_bien_ra_xe_p5",
        "phao_trai_qua_ha_cong_len_ma_bien_ra_xe_p6",
        "phao_trai_qua_ha_cong_len_ma_bien_ra_xe_p7" ,           // 7 -> 278
        "tuan_ha_xa_cong_xa_thu_ha_khau_doai_tot_p1",
        "tuan_ha_xa_cong_xa_thu_ha_khau_doai_tot_p2",
        "tuan_ha_xa_cong_xa_thu_ha_khau_doai_tot_p3",
        "tuan_ha_xa_cong_xa_thu_ha_khau_doai_tot_p4",
        "tuan_ha_xa_cong_xa_thu_ha_khau_doai_tot_p5",
        "tuan_ha_xa_cong_xa_thu_ha_khau_doai_tot_p6",
        "tuan_ha_xa_cong_xa_thu_ha_khau_doai_tot_p7",
        "tuan_ha_xa_cong_xa_thu_ha_khau_doai_tot_p8",
        "tuan_ha_xa_cong_xa_thu_ha_khau_doai_tot_p9",
        "tuan_ha_xa_cong_xa_thu_ha_khau_doai_tot_p10",
        "tuan_ha_xa_cong_xa_thu_ha_khau_doai_tot_p11",          // 11 -> 289
        "cong_xe_phai_thu_ha_sau_len_ma_bat_xe_p1",
        "cong_xe_phai_thu_ha_sau_len_ma_bat_xe_p2",
        "cong_xe_phai_thu_ha_sau_len_ma_bat_xe_p3",
        "cong_xe_phai_thu_ha_sau_len_ma_bat_xe_p4",             // 4 -> 293
        "cong_xe_phai_thu_ha_sau_binh_phao_doi_xe_p1",
        "cong_xe_phai_thu_ha_sau_binh_phao_doi_xe_p2",
        "cong_xe_phai_thu_ha_sau_binh_phao_doi_xe_p3",
        "cong_xe_phai_thu_ha_sau_binh_phao_doi_xe_p4",
        "cong_xe_phai_thu_ha_sau_binh_phao_doi_xe_p5",
        "cong_xe_phai_thu_ha_sau_binh_phao_doi_xe_p6",
        "cong_xe_phai_thu_ha_sau_binh_phao_doi_xe_p7",
        "cong_xe_phai_thu_ha_sau_binh_phao_doi_xe_p8",
        "cong_xe_phai_thu_ha_sau_binh_phao_doi_xe_p9",
        "cong_xe_phai_thu_ha_sau_binh_phao_doi_xe_p10",
        "cong_xe_phai_thu_ha_sau_binh_phao_doi_xe_p11",
        "cong_xe_phai_thu_ha_sau_binh_phao_doi_xe_p12",
        "cong_xe_phai_thu_ha_sau_binh_phao_doi_xe_p13",         // 13 -> 306
        "cong_xe_phai_qua_ha_sau_binh_xe_doi_phao_p1",
        "cong_xe_phai_qua_ha_sau_binh_xe_doi_phao_p2",
        "cong_xe_phai_qua_ha_sau_binh_xe_doi_phao_p3",
        "cong_xe_phai_qua_ha_sau_binh_xe_doi_phao_p4",
        "cong_xe_phai_qua_ha_sau_binh_xe_doi_phao_p5",
        "cong_xe_phai_qua_ha_sau_binh_xe_doi_phao_p6",          // 6 -> 312
        "cong_tien_xe_phai_binh_phao_doi_xe_p1",
        "cong_tien_xe_phai_binh_phao_doi_xe_p2",
        "cong_tien_xe_phai_binh_phao_doi_xe_p3",
        "cong_tien_xe_phai_binh_phao_doi_xe_p4",
        "cong_tien_xe_phai_binh_phao_doi_xe_p5",
        "cong_tien_xe_phai_binh_phao_doi_xe_p6",
        "cong_tien_xe_phai_binh_phao_doi_xe_p7",
        "cong_tien_xe_phai_binh_phao_doi_xe_p9",
        "cong_tien_xe_phai_binh_phao_doi_xe_p10",
        "cong_tien_xe_phai_binh_phao_doi_xe_p11",
        "cong_tien_xe_phai_binh_phao_doi_xe_p12",
        "cong_tien_xe_phai_binh_phao_doi_xe_p13",
        "cong_tien_xe_phai_binh_phao_doi_xe_p14",
        "cong_tien_xe_phai_binh_phao_doi_xe_p15",
        "cong_tien_xe_phai_binh_phao_doi_xe_p16",
        "cong_tien_xe_phai_binh_phao_doi_xe_p17",
        "cong_tien_xe_phai_binh_phao_doi_xe_p18",
        "cong_tien_xe_phai_binh_phao_doi_xe_p19",
        "cong_tien_xe_phai_binh_phao_doi_xe_p20",
        "cong_tien_xe_phai_binh_phao_doi_xe_p21",
        "cong_tien_xe_phai_binh_phao_doi_xe_p22",               // 21 -> 333
        
    ]
    
    static var FileName:[String] {
        get {
            return self.mFileName
        }
    }
    
    static func getFileName() -> String {
        _resetRequest = false // Clear reset request
        if mInternalIndex >= mFileName.count{
            return mFileName[mFileName.count - 1]
        }
        else
        {
            return mFileName[mInternalIndex]
        }
    }
}


