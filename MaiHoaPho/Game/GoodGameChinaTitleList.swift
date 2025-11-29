//
//  GoodGameChinaTitleList.swift
//  MaiHoaPho
//
//  Created by ngoctam on 12/15/18.
//  Copyright © 2018 ngoctam. All rights reserved.
//

import Foundation

class GoodGameChinaTitleList {
    private static var mTreeLevel = 1
    static var TreeLevel: Int{
        get {
            return mTreeLevel
        }
    }
    
    private static let mFileName = [
        "thuan_phao_truc_xa_doi_hoanh_xa",
        "tien_nhan_chi_lo_doi_khoi_ma",
        "Khoi_ma_cuc_doi_dam_tot",
        "trung_phao_qua_ha_xe_doi_binh_phong_ma_binh_phao_doi_xe",
        "khoi_cuc_doi_binh_phao_no_tot",
        "phi_tuong_cuc_doi_qua_cung_phao",
        "trung_phao_qua_ha_xe_tien_ma_bien_doi_binh_phong_ma_binh_phao_doi_xe",
        "trung_phao_qua_ha_xe_that_lot_ma_doi_binh_phong_ma_binh_phao_doi_xe",
        "trung_phao_that_lo_ma_qua_ha_xe_cao_ta_phao_chong_binh_phong_ma_ta_ma_ban_ha",
        "khoi_binh_cuc_chong_binh_phao_no_tot",
        "trung_phao_hoanh_xe_that_lo_ma_chong_binh_phong_ma_huu_phao_qua_ha",
        "phao_dau_chong_binh_phong_ma_song_phao_qua_ha",
        "si_giac_phao_hau_hoan_trung_phao_chong_don_de_ma",
        "thuan_thu_phao_truc_xe_chong_hoanh_xe",
        "phi_tuong_cuc_chong_kim_cau_phao",
        "duong_dau_phao_qua_ha_xe_that_lo_ma_chong_binh_phong_ma_binh_phao_doi_xe_cao_xe_bao_ma",
        "phap_dau_chong_tam_bo_ho",
        // "duong_dau_phao_truc_xe_doi_thuan_thu_phao"
        "phao_dau_chong_phan_cung_ma",
        //"phao_dau_hoanh_xe_that_lo_ma_chong_binh_phong_ma",
        
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
    
    private static let mSectionName = [
        "Thuận pháo trực xe đối hoành xe - Hồ Vinh Hoa vs Lưu Kiện",
        "Tiên nhân chỉ lộ đối khởi mã - Vương Gia Lương vs Hồ Vinh Hoa",
        "Khởi mã cục đối đấm tốt - Liễu Đại Hoa vs Từ Thiên Lợi",
        "Trung pháo quá hà xe đối bình phong mã bình pháo đổi xe - Dương Quan Lân vs Hồ Vinh Hoa",
        "Khởi binh cục đổi pháo nổ tốt - Liễu Đại Hoa vs Dương Quan Lân",
        "Phi tượng cục đối quá cung pháo - Liễu Đại Hoa vs Hồ Vinh Hoa",
        "Trung pháo quá hà xe tiến mã biên đối bình phong mã bình pháo đổi xe - Dương Quan Lân vs Liễu Đại Hoa",
        "Trung pháo quá hà xe thất lộ mã đối bình phong mã bình pháo đổi xe - Hồ Vinh Hoa vs Dương Quan Lân",
        "Trung pháo thất lộ mã quá hà xe cao tả pháo chống bình phong mã tả mã bàn hà - Lưu Kiện vs Cam Dịch Hộ",
        "Khởi binh cục chống bình pháo nổ tốt - Hồ Vinh Hoa vs Liễu Đại Hoa",
        "Trung pháo hoành xe thất lộ mã chống bình phong mã hữu pháo quá hà - Dương Quan Lân vs Liễu Đại Hoa",
        "Pháo đầu chống bình phong mã song pháo quá hà - Hồ Vinh Hoa vs Liễu Đại Hoa",
        "Sĩ giác pháo hậu hoàn trung pháo chống đơn đề mã - Lý Lai Quần vs Triệu Như Quyền",
        "Thuận thủ pháo trực xe chống hoành xe - Dương Quan Lân vs Hồ Vinh Hoa",
        "Phi tượng cục chống kim câu pháo - Lý Lai Quần vs Hồ Vinh Hoa",
        "Đương đầu pháo quá hà xe thất lộ mã chống bình phong mã bình pháo đổi xe cao xe bảo mã - Dương Quan Lân vs Liễu Đại Hoa",
        "Pháo đầu chống tam bộ hổ - Liễu Đại Hoa vs Dương Quan Lân",
        // "Đương đầu pháo trực xe đối thuận thủ pháo - Dương Quan Lân vs Hồ Vinh Hoa"
        "Pháo đầu chống phản cung mã - Lý Lai Quần vs Hồ Vinh Hoa",
        //"Pháo đầu hoành xe thất lộ mã chống bình phong mã - Hồ Vinh Hoa vs Lý Lai Quần",
    ]
    
    static var SectionNumbers: [Int]{
        get{
            return [mSectionName.count] // There is only one section for this list
        }
    }
    
    static var SectionName:[String]{
        get{
            return mSectionName
        }
    }
    
    private static var _resetRequest = false
    static var ResetRequest: Bool{
        get {
            return self._resetRequest
        }
    }
    
    private static var mInternalIndex = 0
    static var InternalIndex: Int {
        get {
            return self.mInternalIndex
        }
        set (newvalue){
            if mInternalIndex != newvalue{
                self._resetRequest = true
            }
            
            if newvalue >= self.FileName.count{
                mInternalIndex = self.FileName.count - 1
            }
            else if newvalue < 0{
                mInternalIndex = 0
            }
            else{
                mInternalIndex = newvalue
            }
        }
    }
    
    private static var mlastTitleRow = 0
    static var lastTitleRow : Int{
        get{
            return self.mlastTitleRow
        }
        set(newvalue){
            if newvalue >= self.FileName.count{
                mlastTitleRow = self.FileName.count - 1
            }
            else if newvalue < 0{
                mlastTitleRow = 0
            }
            else{
                mlastTitleRow = newvalue
            }
        }
    }
    
    private static var _lastTitleSection = 0
    static var lastTitleSection:Int{
        get{
            return self._lastTitleSection
        }
        set(newvalue){
            if (newvalue > 1)
            {
                _lastTitleSection = 0
            }
            else
            {
                self._lastTitleSection = newvalue
            }
        }
    }
}
