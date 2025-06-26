(define (problem subway)

    (:domain city-subway)

    (:objects 
        passenger0 - passenger

		Line_S1 - line
		Line_1 - line
		Line_2 - line
		Line_3 - line
		Line_4 - line
		Line_5 - line
		Line_6 - line
		Line_7 - line
		Line_8 - line
		Line_9 - line
		Line_10 - line
		Line_11 - line
		Line_12 - line
		Line_13 - line
		Line_14 - line
		Line_15 - line
		Line_16 - line
		Line_17 - line
		Line_17_North - line
		Line_19 - line
		Changping_Line - line
		Daxing_Airport_Express - line
		Fangshan_Line - line
		Capital_Airport_Express - line
		Xijiao_Line - line
		Yanfang_Line - line
		Yizhuang_Line - line

		PingGuoYuan - station
		JinAn_Qiao - station
		si_dao_qiao - station
		qiao_hu_ying - station
		shang_an - station
		li_yuan_zhuang - station
		xiao_yuan - station
		shi_chang - station
		gu_cheng - station
		ba_jiao_you_le_yuan - station
		ba_bao_shan - station
		yu_quan_lu - station
		wu_ke_song - station
		wan_shou_lu - station
		gong_zhu_fen - station
		jun_shi_bo_wu_guan - station
		MuXiDi - station
		nan_li_shi_lu - station
		fu_xing_men - station
		xi_dan - station
		tian_an_men_xi - station
		tian_an_men_dong - station
		WangFuJing - station
		dong_dan - station
		jian_guo_men - station
		yong_an_li - station
		guo_mao - station
		DaWang_Lu - station
		SiHui - station
		Si_HuiDong - station
		GaoBeiDian - station
		ChuanMei_DaXue - station
		ShuangQiao - station
		GuanZhuang - station
		BaLiQiao - station
		TongZhouBeiYuan - station
		GuoYuan - station
		JiuKeShu - station
		LiYuan - station
		LinHeLi - station
		TuQiao - station
		HuaZhuang - station
		HuanQiu_DuJiaQu - station
		JiShuiTan - station
		gu_lou_da_jie - station
		an_ding_men - station
		yong_he_gong - station
		dong_zhi_men - station
		Dong_SiShi_Tiao - station
		zhao_yang_men - station
		bei_jing_zhan - station
		chong_wen_men - station
		QianMen - station
		he_ping_men - station
		xuan_wu_men - station
		chang_chun_jie - station
		FuChengMen - station
		che_gong_zhuang - station
		XiZhiMen - station
		GongRen_TiYuChang - station
		TuanJieHu - station
		ChaoYangGongYuan - station
		ShiFoYing - station
		ChaoYang_Zhan - station
		YaoJiaYuan - station
		DongBaNan - station
		DongBa - station
		DongBa_Bei - station
		tian_gong_yuan - station
		sheng_wu_yi_yao_ji_di - station
		yi_he_zhuang - station
		huang_cun_huo_che_zhan - station
		huang_cun_xi_da_jie - station
		qing_yuan_lu - station
		zao_yuan - station
		gao_mi_dian_nan - station
		gao_mi_dian_bei - station
		xi_hong_men - station
		XinGong - station
		gong_yi_xi_qiao - station
		jiao_men_xi - station
		ma_jia_bao - station
		BeiJing_NanZhan - station
		tao_ran_ting - station
		cai_shi_kou - station
		ling_jing_hu_tong - station
		xi_si - station
		PingAnLi - station
		xin_jie_kou - station
		dong_wu_yuan - station
		GuoJia_TuShuGuan - station
		wei_gong_cun - station
		RenMin_DaXue - station
		hai_dian_huang_zhuang - station
		zhong_guan_cun - station
		bei_jing_da_xue_dong_men - station
		yuan_ming_yuan - station
		xi_yuan - station
		bei_gong_men - station
		an_he_qiao_bei - station
		song_jia_zhuang - station
		liu_jia_yao - station
		PuHuangYu - station
		tian_tan_dong_men - station
		ci_qi_kou - station
		deng_shi_kou - station
		dong_si - station
		zhang_zi_zhong_lu - station
		BeiXinQiao - station
		he_ping_li_bei_jie - station
		HePing_XiQiao - station
		hui_xin_xi_jie_nan_kou - station
		hui_xin_xi_jie_bei_kou - station
		da_tun_lu_dong - station
		bei_yuan_lu_bei - station
		li_shui_qiao_nan - station
		li_shui_qiao - station
		tian_tong_yuan_nan - station
		tian_tong_yuan - station
		tian_tong_yuan_bei - station
		lu_cheng - station
		dong_xia_yuan - station
		hao_jia_fu - station
		bei_yun_he_dong - station
		bei_yun_he_xi - station
		tong_zhou_bei_guan - station
		wu_zi_xue_yuan_lu - station
		cao_fang - station
		chang_ying - station
		huang_qu - station
		da_lian_po - station
		qing_nian_lu - station
		shi_li_bao - station
		JinTai_Lu - station
		hu_jia_lou - station
		dong_da_qiao - station
		nan_luo_gu_xiang - station
		bei_hai_bei - station
		CheGongZhuang_Xi - station
		ErLiGou - station
		bai_shi_qiao_nan - station
		hua_yuan_qiao - station
		ci_shou_si - station
		hai_dian_wu_lu_ju - station
		tian_cun - station
		liao_gong_zhuang - station
		xi_huang_cun - station
		yang_zhuang - station
		GaoLouJin - station
		QunFang - station
		WanShengDong - station
		WanShengXi - station
		HeiZhuangHu - station
		Lang_XinZhuang - station
		HuangChang - station
		jiao_hua_chang - station
		shuang_he - station
		fa_tou - station
		huan_le_gu_jing_qu - station
		nan_lou_zi_zhuang - station
		hua_gong - station
		bai_zi_wan - station
		da_jiao_ting - station
		JiuLongShan - station
		ShuangJing - station
		guang_qu_men_wai - station
		guang_qu_men_nei - station
		qiao_wan - station
		ZhuShiKou - station
		hu_fang_qiao - station
		guang_an_men_nei - station
		DaGuanYing - station
		wan_zi - station
		bei_jing_xi_zhan - station
		YingHai - station
		DeMao - station
		WuFu_Tang - station
		HuoJian_WanYuan - station
		DongGaoDi - station
		HeYi - station
		DaHongMen_Nan - station
		HaiHuTun - station
		MuXiYuan - station
		YongDing_MenWai - station
		TianQiao - station
		JinYu_HuTong - station
		zhong_guo_mei_shu_guan - station
		shi_cha_hai - station
		an_de_li_bei_jie - station
		AnHua_Qiao - station
		bei_tu_cheng - station
		ao_ti_zhong_xin - station
		ao_lin_pi_ke_gong_yuan - station
		sen_lin_gong_yuan_nan_men - station
		lin_cui_qiao - station
		yong_tai_zhuang - station
		xi_xiao_kou - station
		yu_xin - station
		HuoYing - station
		hui_long_guan_dong_da_jie - station
		ping_xi_fu - station
		yu_zhi_lu - station
		zhu_xin_zhuang - station
		GuoGongZhuang - station
		FengTai_KeJiYuan - station
		KeYi_Lu - station
		FengTai_NanLu - station
		FengTai_DongDaJie - station
		QiLiZhuang - station
		liu_li_qiao - station
		liu_li_qiao_dong - station
		bai_dui_zi - station
		BaGou - station
		SuZhou_Jie - station
		zhi_chun_li - station
		ZhiChun_Lu - station
		XiTuCheng - station
		MuDanYuan - station
		jian_de_men - station
		an_zhen_men - station
		shao_yao_ju - station
		TaiYangGong - station
		SanYuan_Qiao - station
		liang_ma_qiao - station
		nong_ye_zhan_lan_guan - station
		jin_tai_xi_zhao - station
		jin_song - station
		pan_jia_yuan - station
		ShiLiHe - station
		fen_zhong_si - station
		cheng_shou_si - station
		shi_liu_zhuang - station
		da_hong_men - station
		jiao_men_dong - station
		CaoQiao - station
		ji_jia_miao - station
		ShouJingMao - station
		FengTai_Zhan - station
		ni_wa - station
		XiJu - station
		lian_hua_qiao - station
		xi_diao_yu_tai - station
		che_dao_gou - station
		ChangChun_Qiao - station
		huo_qi_ying - station
		MoShiKou - station
		BeiXinAn - station
		XinShouGang - station
		DongBa_Xi - station
		TuoFangYing - station
		GaoJiaYuan - station
		Jiang_TaiXi - station
		XiBaHe - station
		GuangXiMen - station
		AnZhen_Qiao - station
		MaDianQiao - station
		BeiTaiPingZhuang - station
		JiMen_Qiao - station
		DaZhongSi - station
		SuZhou_Qiao - station
		LanDianChang - station
		SiJiQing_Qiao - station
		wu_dao_kou - station
		shang_di - station
		QingHe_Zhan - station
		XiErQi - station
		long_ze - station
		hui_long_guan - station
		bei_yuan - station
		wang_jing_xi - station
		liu_fang - station
		ShanGeZhuang - station
		LaiGuangYing - station
		DongHu_Qu - station
		WangJing - station
		FuTong - station
		WangJing_Nan - station
		JiangTai - station
		DongFeng_BeiQiao - station
		ZaoYing - station
		PingLeYuan - station
		BeiGong_DaXiMen - station
		FangZhuang - station
		JingTai - station
		JingFengMen - station
		Xi_TieYing - station
		CaiHuYing - station
		LiZe_ShangWu_Qu - station
		DongGuanTou - station
		DaJing - station
		GuoZhuangZi - station
		DaWaYao - station
		YuanBoYuan - station
		ZhangGuoZhuang - station
		feng_bo - station
		shun_yi - station
		shi_men - station
		nan_fa_xin - station
		hou_sha_yu - station
		hua_li_kan - station
		guo_zhan - station
		sun_he - station
		ma_quan_ying - station
		cui_ge_zhuang - station
		wang_jing_dong - station
		guan_zhuang - station
		an_li_lu - station
		bei_sha_tan - station
		LiuDaoKou - station
		qing_hua_dong_lu_xi_kou - station
		bei_an_he - station
		wen_yang_lu - station
		dao_xiang_hu_lu - station
		tun_dian - station
		yong_feng - station
		yong_feng_nan - station
		xi_bei_wang - station
		ma_lian_wa - station
		nong_da_nan_lu - station
		WanQuanHe_Qiao - station
		WanShouSi - station
		GanJiaKou - station
		YuYuanTan_DongMen - station
		HongLian_NanLu - station
		DongGuanTou_Nan - station
		FuFeng_Qiao - station
		KanDan - station
		YuShuZhuang - station
		HongTaiZhuang - station
		WanPingCheng - station
		ZhouJiaZhuang - station
		ShiBaLiDian - station
		BeiShenShu - station
		CiQu_Bei - station
		CiQu - station
		JiaHuiHu - station
		WeiLai_KeXue_ChengBei - station
		WeiLai_KeXueCheng - station
		TianTong_YuanDong - station
		QingHeYing - station
		HongJunYing - station
		ZuoJiaZhuang - station
		XinFaDi - station
		NiuJie - station
		TaiPingQiao - station
		chang_ping_xi_shan_kou - station
		shi_san_ling_jing_qu - station
		chang_ping - station
		chang_ping_dong_guan - station
		bei_shao_wa - station
		nan_shao - station
		sha_he_gao_jiao_yuan - station
		sha_he - station
		gong_hua_cheng - station
		sheng_ming_ke_xue_yuan - station
		ZhuFang_Bei - station
		QingHe_XiaoYing_Qiao - station
		XueZhiYuan - station
		XueYuan_Qiao - station
		DaXing_XinCheng - station
		DaXing_JiChang - station
		yan_cun_dong - station
		su_zhuang - station
		liang_xiang_nan_guan - station
		liang_xiang_da_xue_cheng_xi - station
		liang_xiang_da_xue_cheng - station
		liang_xiang_da_xue_cheng_bei - station
		guang_yang_cheng - station
		li_ba_fang - station
		chang_yang - station
		dao_tian - station
		DaBaoTai - station
		BaiPen_Yao - station
		HuaXiang_DongQiao - station
		Three_Hao_HangZhanLou - station
		Two_Hao_HangZhanLou - station
		yi_he_yuan_xi_men - station
		cha_peng - station
		wan_an - station
		GuoJia_ZhiWuYuan - station
		xiang_shan - station
		zi_cao_wu - station
		yan_cun - station
		xing_cheng - station
		da_shi_he_dong - station
		ma_ge_zhuang - station
		rao_le_fu - station
		fang_shan_cheng_guan - station
		yan_shan - station
		xiao_cun - station
		xiao_hong_men - station
		jiu_gong - station
		yi_zhuang_qiao - station
		yi_zhuang_wen_hua_yuan - station
		wan_yuan_jie - station
		rong_jing_dong_jie - station
		rong_chang_dong_jie - station
		tong_ji_nan_lu - station
		jing_hai_lu - station
		ci_qu_nan - station
		yi_zhuang_huo_che_zhan - station
    )
    
    (:init
        (at passenger0 shun_yi)
		(connected PingGuoYuan JinAn_Qiao Line_S1)
		(connected JinAn_Qiao si_dao_qiao Line_S1)
		(connected si_dao_qiao qiao_hu_ying Line_S1)
		(connected qiao_hu_ying shang_an Line_S1)
		(connected shang_an li_yuan_zhuang Line_S1)
		(connected li_yuan_zhuang xiao_yuan Line_S1)
		(connected xiao_yuan shi_chang Line_S1)
		(connected gu_cheng ba_jiao_you_le_yuan Line_1)
		(connected ba_jiao_you_le_yuan ba_bao_shan Line_1)
		(connected ba_bao_shan yu_quan_lu Line_1)
		(connected yu_quan_lu wu_ke_song Line_1)
		(connected wu_ke_song wan_shou_lu Line_1)
		(connected wan_shou_lu gong_zhu_fen Line_1)
		(connected gong_zhu_fen jun_shi_bo_wu_guan Line_1)
		(connected jun_shi_bo_wu_guan MuXiDi Line_1)
		(connected MuXiDi nan_li_shi_lu Line_1)
		(connected nan_li_shi_lu fu_xing_men Line_1)
		(connected fu_xing_men xi_dan Line_1)
		(connected xi_dan tian_an_men_xi Line_1)
		(connected tian_an_men_xi tian_an_men_dong Line_1)
		(connected tian_an_men_dong WangFuJing Line_1)
		(connected WangFuJing dong_dan Line_1)
		(connected dong_dan jian_guo_men Line_1)
		(connected jian_guo_men yong_an_li Line_1)
		(connected yong_an_li guo_mao Line_1)
		(connected guo_mao DaWang_Lu Line_1)
		(connected DaWang_Lu SiHui Line_1)
		(connected SiHui Si_HuiDong Line_1)
		(connected Si_HuiDong GaoBeiDian Line_1)
		(connected GaoBeiDian ChuanMei_DaXue Line_1)
		(connected ChuanMei_DaXue ShuangQiao Line_1)
		(connected ShuangQiao GuanZhuang Line_1)
		(connected GuanZhuang BaLiQiao Line_1)
		(connected BaLiQiao TongZhouBeiYuan Line_1)
		(connected TongZhouBeiYuan GuoYuan Line_1)
		(connected GuoYuan JiuKeShu Line_1)
		(connected JiuKeShu LiYuan Line_1)
		(connected LiYuan LinHeLi Line_1)
		(connected LinHeLi TuQiao Line_1)
		(connected TuQiao HuaZhuang Line_1)
		(connected HuaZhuang HuanQiu_DuJiaQu Line_1)
		(connected JiShuiTan gu_lou_da_jie Line_2)
		(connected gu_lou_da_jie an_ding_men Line_2)
		(connected an_ding_men yong_he_gong Line_2)
		(connected yong_he_gong dong_zhi_men Line_2)
		(connected dong_zhi_men Dong_SiShi_Tiao Line_2)
		(connected Dong_SiShi_Tiao zhao_yang_men Line_2)
		(connected zhao_yang_men jian_guo_men Line_2)
		(connected jian_guo_men bei_jing_zhan Line_2)
		(connected bei_jing_zhan chong_wen_men Line_2)
		(connected chong_wen_men QianMen Line_2)
		(connected QianMen he_ping_men Line_2)
		(connected he_ping_men xuan_wu_men Line_2)
		(connected xuan_wu_men chang_chun_jie Line_2)
		(connected chang_chun_jie fu_xing_men Line_2)
		(connected fu_xing_men FuChengMen Line_2)
		(connected FuChengMen che_gong_zhuang Line_2)
		(connected che_gong_zhuang XiZhiMen Line_2)
		(connected Dong_SiShi_Tiao GongRen_TiYuChang Line_3)
		(connected GongRen_TiYuChang TuanJieHu Line_3)
		(connected TuanJieHu ChaoYangGongYuan Line_3)
		(connected ChaoYangGongYuan ShiFoYing Line_3)
		(connected ShiFoYing ChaoYang_Zhan Line_3)
		(connected ChaoYang_Zhan YaoJiaYuan Line_3)
		(connected YaoJiaYuan DongBaNan Line_3)
		(connected DongBaNan DongBa Line_3)
		(connected DongBa DongBa_Bei Line_3)
		(connected tian_gong_yuan sheng_wu_yi_yao_ji_di Line_4)
		(connected sheng_wu_yi_yao_ji_di yi_he_zhuang Line_4)
		(connected yi_he_zhuang huang_cun_huo_che_zhan Line_4)
		(connected huang_cun_huo_che_zhan huang_cun_xi_da_jie Line_4)
		(connected huang_cun_xi_da_jie qing_yuan_lu Line_4)
		(connected qing_yuan_lu zao_yuan Line_4)
		(connected zao_yuan gao_mi_dian_nan Line_4)
		(connected gao_mi_dian_nan gao_mi_dian_bei Line_4)
		(connected gao_mi_dian_bei xi_hong_men Line_4)
		(connected xi_hong_men XinGong Line_4)
		(connected XinGong gong_yi_xi_qiao Line_4)
		(connected gong_yi_xi_qiao jiao_men_xi Line_4)
		(connected jiao_men_xi ma_jia_bao Line_4)
		(connected ma_jia_bao BeiJing_NanZhan Line_4)
		(connected BeiJing_NanZhan tao_ran_ting Line_4)
		(connected tao_ran_ting cai_shi_kou Line_4)
		(connected cai_shi_kou xuan_wu_men Line_4)
		(connected xuan_wu_men xi_dan Line_4)
		(connected xi_dan ling_jing_hu_tong Line_4)
		(connected ling_jing_hu_tong xi_si Line_4)
		(connected xi_si PingAnLi Line_4)
		(connected PingAnLi xin_jie_kou Line_4)
		(connected xin_jie_kou XiZhiMen Line_4)
		(connected XiZhiMen dong_wu_yuan Line_4)
		(connected dong_wu_yuan GuoJia_TuShuGuan Line_4)
		(connected GuoJia_TuShuGuan wei_gong_cun Line_4)
		(connected wei_gong_cun RenMin_DaXue Line_4)
		(connected RenMin_DaXue hai_dian_huang_zhuang Line_4)
		(connected hai_dian_huang_zhuang zhong_guan_cun Line_4)
		(connected zhong_guan_cun bei_jing_da_xue_dong_men Line_4)
		(connected bei_jing_da_xue_dong_men yuan_ming_yuan Line_4)
		(connected yuan_ming_yuan xi_yuan Line_4)
		(connected xi_yuan bei_gong_men Line_4)
		(connected bei_gong_men an_he_qiao_bei Line_4)
		(connected song_jia_zhuang liu_jia_yao Line_5)
		(connected liu_jia_yao PuHuangYu Line_5)
		(connected PuHuangYu tian_tan_dong_men Line_5)
		(connected tian_tan_dong_men ci_qi_kou Line_5)
		(connected ci_qi_kou chong_wen_men Line_5)
		(connected chong_wen_men dong_dan Line_5)
		(connected dong_dan deng_shi_kou Line_5)
		(connected deng_shi_kou dong_si Line_5)
		(connected dong_si zhang_zi_zhong_lu Line_5)
		(connected zhang_zi_zhong_lu BeiXinQiao Line_5)
		(connected BeiXinQiao yong_he_gong Line_5)
		(connected yong_he_gong he_ping_li_bei_jie Line_5)
		(connected he_ping_li_bei_jie HePing_XiQiao Line_5)
		(connected HePing_XiQiao hui_xin_xi_jie_nan_kou Line_5)
		(connected hui_xin_xi_jie_nan_kou hui_xin_xi_jie_bei_kou Line_5)
		(connected hui_xin_xi_jie_bei_kou da_tun_lu_dong Line_5)
		(connected da_tun_lu_dong bei_yuan_lu_bei Line_5)
		(connected bei_yuan_lu_bei li_shui_qiao_nan Line_5)
		(connected li_shui_qiao_nan li_shui_qiao Line_5)
		(connected li_shui_qiao tian_tong_yuan_nan Line_5)
		(connected tian_tong_yuan_nan tian_tong_yuan Line_5)
		(connected tian_tong_yuan tian_tong_yuan_bei Line_5)
		(connected lu_cheng dong_xia_yuan Line_6)
		(connected dong_xia_yuan hao_jia_fu Line_6)
		(connected hao_jia_fu bei_yun_he_dong Line_6)
		(connected bei_yun_he_dong bei_yun_he_xi Line_6)
		(connected bei_yun_he_xi tong_zhou_bei_guan Line_6)
		(connected tong_zhou_bei_guan wu_zi_xue_yuan_lu Line_6)
		(connected wu_zi_xue_yuan_lu cao_fang Line_6)
		(connected cao_fang chang_ying Line_6)
		(connected chang_ying huang_qu Line_6)
		(connected huang_qu da_lian_po Line_6)
		(connected da_lian_po qing_nian_lu Line_6)
		(connected qing_nian_lu shi_li_bao Line_6)
		(connected shi_li_bao JinTai_Lu Line_6)
		(connected JinTai_Lu hu_jia_lou Line_6)
		(connected hu_jia_lou dong_da_qiao Line_6)
		(connected dong_da_qiao zhao_yang_men Line_6)
		(connected zhao_yang_men dong_si Line_6)
		(connected dong_si nan_luo_gu_xiang Line_6)
		(connected nan_luo_gu_xiang bei_hai_bei Line_6)
		(connected bei_hai_bei PingAnLi Line_6)
		(connected PingAnLi che_gong_zhuang Line_6)
		(connected che_gong_zhuang CheGongZhuang_Xi Line_6)
		(connected CheGongZhuang_Xi ErLiGou Line_6)
		(connected ErLiGou bai_shi_qiao_nan Line_6)
		(connected bai_shi_qiao_nan hua_yuan_qiao Line_6)
		(connected hua_yuan_qiao ci_shou_si Line_6)
		(connected ci_shou_si hai_dian_wu_lu_ju Line_6)
		(connected hai_dian_wu_lu_ju tian_cun Line_6)
		(connected tian_cun liao_gong_zhuang Line_6)
		(connected liao_gong_zhuang xi_huang_cun Line_6)
		(connected xi_huang_cun yang_zhuang Line_6)
		(connected yang_zhuang PingGuoYuan Line_6)
		(connected PingGuoYuan JinAn_Qiao Line_6)
		(connected HuanQiu_DuJiaQu HuaZhuang Line_7)
		(connected HuaZhuang GaoLouJin Line_7)
		(connected GaoLouJin QunFang Line_7)
		(connected QunFang WanShengDong Line_7)
		(connected WanShengDong WanShengXi Line_7)
		(connected WanShengXi HeiZhuangHu Line_7)
		(connected HeiZhuangHu Lang_XinZhuang Line_7)
		(connected Lang_XinZhuang HuangChang Line_7)
		(connected HuangChang jiao_hua_chang Line_7)
		(connected jiao_hua_chang shuang_he Line_7)
		(connected shuang_he fa_tou Line_7)
		(connected fa_tou huan_le_gu_jing_qu Line_7)
		(connected huan_le_gu_jing_qu nan_lou_zi_zhuang Line_7)
		(connected nan_lou_zi_zhuang hua_gong Line_7)
		(connected hua_gong bai_zi_wan Line_7)
		(connected bai_zi_wan da_jiao_ting Line_7)
		(connected da_jiao_ting JiuLongShan Line_7)
		(connected JiuLongShan ShuangJing Line_7)
		(connected ShuangJing guang_qu_men_wai Line_7)
		(connected guang_qu_men_wai guang_qu_men_nei Line_7)
		(connected guang_qu_men_nei ci_qi_kou Line_7)
		(connected ci_qi_kou qiao_wan Line_7)
		(connected qiao_wan ZhuShiKou Line_7)
		(connected ZhuShiKou hu_fang_qiao Line_7)
		(connected hu_fang_qiao cai_shi_kou Line_7)
		(connected cai_shi_kou guang_an_men_nei Line_7)
		(connected guang_an_men_nei DaGuanYing Line_7)
		(connected DaGuanYing wan_zi Line_7)
		(connected wan_zi bei_jing_xi_zhan Line_7)
		(connected YingHai DeMao Line_8)
		(connected DeMao WuFu_Tang Line_8)
		(connected WuFu_Tang HuoJian_WanYuan Line_8)
		(connected HuoJian_WanYuan DongGaoDi Line_8)
		(connected DongGaoDi HeYi Line_8)
		(connected HeYi DaHongMen_Nan Line_8)
		(connected DaHongMen_Nan HaiHuTun Line_8)
		(connected HaiHuTun MuXiYuan Line_8)
		(connected MuXiYuan YongDing_MenWai Line_8)
		(connected YongDing_MenWai TianQiao Line_8)
		(connected TianQiao ZhuShiKou Line_8)
		(connected ZhuShiKou QianMen Line_8)
		(connected QianMen WangFuJing Line_8)
		(connected WangFuJing JinYu_HuTong Line_8)
		(connected JinYu_HuTong zhong_guo_mei_shu_guan Line_8)
		(connected zhong_guo_mei_shu_guan nan_luo_gu_xiang Line_8)
		(connected nan_luo_gu_xiang shi_cha_hai Line_8)
		(connected shi_cha_hai gu_lou_da_jie Line_8)
		(connected gu_lou_da_jie an_de_li_bei_jie Line_8)
		(connected an_de_li_bei_jie AnHua_Qiao Line_8)
		(connected AnHua_Qiao bei_tu_cheng Line_8)
		(connected bei_tu_cheng ao_ti_zhong_xin Line_8)
		(connected ao_ti_zhong_xin ao_lin_pi_ke_gong_yuan Line_8)
		(connected ao_lin_pi_ke_gong_yuan sen_lin_gong_yuan_nan_men Line_8)
		(connected sen_lin_gong_yuan_nan_men lin_cui_qiao Line_8)
		(connected lin_cui_qiao yong_tai_zhuang Line_8)
		(connected yong_tai_zhuang xi_xiao_kou Line_8)
		(connected xi_xiao_kou yu_xin Line_8)
		(connected yu_xin HuoYing Line_8)
		(connected HuoYing hui_long_guan_dong_da_jie Line_8)
		(connected hui_long_guan_dong_da_jie ping_xi_fu Line_8)
		(connected ping_xi_fu yu_zhi_lu Line_8)
		(connected yu_zhi_lu zhu_xin_zhuang Line_8)
		(connected GuoGongZhuang FengTai_KeJiYuan Line_9)
		(connected FengTai_KeJiYuan KeYi_Lu Line_9)
		(connected KeYi_Lu FengTai_NanLu Line_9)
		(connected FengTai_NanLu FengTai_DongDaJie Line_9)
		(connected FengTai_DongDaJie QiLiZhuang Line_9)
		(connected QiLiZhuang liu_li_qiao Line_9)
		(connected liu_li_qiao liu_li_qiao_dong Line_9)
		(connected liu_li_qiao_dong bei_jing_xi_zhan Line_9)
		(connected bei_jing_xi_zhan jun_shi_bo_wu_guan Line_9)
		(connected jun_shi_bo_wu_guan bai_dui_zi Line_9)
		(connected bai_dui_zi bai_shi_qiao_nan Line_9)
		(connected bai_shi_qiao_nan GuoJia_TuShuGuan Line_9)
		(connected BaGou SuZhou_Jie Line_10)
		(connected SuZhou_Jie hai_dian_huang_zhuang Line_10)
		(connected hai_dian_huang_zhuang zhi_chun_li Line_10)
		(connected zhi_chun_li ZhiChun_Lu Line_10)
		(connected ZhiChun_Lu XiTuCheng Line_10)
		(connected XiTuCheng MuDanYuan Line_10)
		(connected MuDanYuan jian_de_men Line_10)
		(connected jian_de_men bei_tu_cheng Line_10)
		(connected bei_tu_cheng an_zhen_men Line_10)
		(connected an_zhen_men hui_xin_xi_jie_nan_kou Line_10)
		(connected hui_xin_xi_jie_nan_kou shao_yao_ju Line_10)
		(connected shao_yao_ju TaiYangGong Line_10)
		(connected TaiYangGong SanYuan_Qiao Line_10)
		(connected SanYuan_Qiao liang_ma_qiao Line_10)
		(connected liang_ma_qiao nong_ye_zhan_lan_guan Line_10)
		(connected nong_ye_zhan_lan_guan TuanJieHu Line_10)
		(connected TuanJieHu hu_jia_lou Line_10)
		(connected hu_jia_lou jin_tai_xi_zhao Line_10)
		(connected jin_tai_xi_zhao guo_mao Line_10)
		(connected guo_mao ShuangJing Line_10)
		(connected ShuangJing jin_song Line_10)
		(connected jin_song pan_jia_yuan Line_10)
		(connected pan_jia_yuan ShiLiHe Line_10)
		(connected ShiLiHe fen_zhong_si Line_10)
		(connected fen_zhong_si cheng_shou_si Line_10)
		(connected cheng_shou_si song_jia_zhuang Line_10)
		(connected song_jia_zhuang shi_liu_zhuang Line_10)
		(connected shi_liu_zhuang da_hong_men Line_10)
		(connected da_hong_men jiao_men_dong Line_10)
		(connected jiao_men_dong jiao_men_xi Line_10)
		(connected jiao_men_xi CaoQiao Line_10)
		(connected CaoQiao ji_jia_miao Line_10)
		(connected ji_jia_miao ShouJingMao Line_10)
		(connected ShouJingMao FengTai_Zhan Line_10)
		(connected FengTai_Zhan ni_wa Line_10)
		(connected ni_wa XiJu Line_10)
		(connected XiJu liu_li_qiao Line_10)
		(connected liu_li_qiao lian_hua_qiao Line_10)
		(connected lian_hua_qiao gong_zhu_fen Line_10)
		(connected gong_zhu_fen xi_diao_yu_tai Line_10)
		(connected xi_diao_yu_tai ci_shou_si Line_10)
		(connected ci_shou_si che_dao_gou Line_10)
		(connected che_dao_gou ChangChun_Qiao Line_10)
		(connected ChangChun_Qiao huo_qi_ying Line_10)
		(connected MoShiKou JinAn_Qiao Line_11)
		(connected JinAn_Qiao BeiXinAn Line_11)
		(connected BeiXinAn XinShouGang Line_11)
		(connected DongBa_Bei DongBa_Xi Line_12)
		(connected DongBa_Xi TuoFangYing Line_12)
		(connected TuoFangYing GaoJiaYuan Line_12)
		(connected GaoJiaYuan Jiang_TaiXi Line_12)
		(connected Jiang_TaiXi SanYuan_Qiao Line_12)
		(connected SanYuan_Qiao XiBaHe Line_12)
		(connected XiBaHe GuangXiMen Line_12)
		(connected GuangXiMen HePing_XiQiao Line_12)
		(connected HePing_XiQiao AnZhen_Qiao Line_12)
		(connected AnZhen_Qiao AnHua_Qiao Line_12)
		(connected AnHua_Qiao MaDianQiao Line_12)
		(connected MaDianQiao BeiTaiPingZhuang Line_12)
		(connected BeiTaiPingZhuang JiMen_Qiao Line_12)
		(connected JiMen_Qiao DaZhongSi Line_12)
		(connected DaZhongSi RenMin_DaXue Line_12)
		(connected RenMin_DaXue SuZhou_Qiao Line_12)
		(connected SuZhou_Qiao ChangChun_Qiao Line_12)
		(connected ChangChun_Qiao LanDianChang Line_12)
		(connected LanDianChang SiJiQing_Qiao Line_12)
		(connected XiZhiMen DaZhongSi Line_13)
		(connected DaZhongSi ZhiChun_Lu Line_13)
		(connected ZhiChun_Lu wu_dao_kou Line_13)
		(connected wu_dao_kou shang_di Line_13)
		(connected shang_di QingHe_Zhan Line_13)
		(connected QingHe_Zhan XiErQi Line_13)
		(connected XiErQi long_ze Line_13)
		(connected long_ze hui_long_guan Line_13)
		(connected hui_long_guan HuoYing Line_13)
		(connected HuoYing li_shui_qiao Line_13)
		(connected li_shui_qiao bei_yuan Line_13)
		(connected bei_yuan wang_jing_xi Line_13)
		(connected wang_jing_xi shao_yao_ju Line_13)
		(connected shao_yao_ju GuangXiMen Line_13)
		(connected GuangXiMen liu_fang Line_13)
		(connected liu_fang dong_zhi_men Line_13)
		(connected ShanGeZhuang LaiGuangYing Line_14)
		(connected LaiGuangYing DongHu_Qu Line_14)
		(connected DongHu_Qu WangJing Line_14)
		(connected WangJing FuTong Line_14)
		(connected FuTong WangJing_Nan Line_14)
		(connected WangJing_Nan JiangTai Line_14)
		(connected JiangTai DongFeng_BeiQiao Line_14)
		(connected DongFeng_BeiQiao ZaoYing Line_14)
		(connected ZaoYing ChaoYangGongYuan Line_14)
		(connected ChaoYangGongYuan JinTai_Lu Line_14)
		(connected JinTai_Lu DaWang_Lu Line_14)
		(connected DaWang_Lu JiuLongShan Line_14)
		(connected JiuLongShan PingLeYuan Line_14)
		(connected PingLeYuan BeiGong_DaXiMen Line_14)
		(connected BeiGong_DaXiMen ShiLiHe Line_14)
		(connected ShiLiHe FangZhuang Line_14)
		(connected FangZhuang PuHuangYu Line_14)
		(connected PuHuangYu JingTai Line_14)
		(connected JingTai YongDing_MenWai Line_14)
		(connected YongDing_MenWai BeiJing_NanZhan Line_14)
		(connected BeiJing_NanZhan JingFengMen Line_14)
		(connected JingFengMen Xi_TieYing Line_14)
		(connected Xi_TieYing CaiHuYing Line_14)
		(connected CaiHuYing LiZe_ShangWu_Qu Line_14)
		(connected LiZe_ShangWu_Qu DongGuanTou Line_14)
		(connected DongGuanTou XiJu Line_14)
		(connected XiJu QiLiZhuang Line_14)
		(connected QiLiZhuang DaJing Line_14)
		(connected DaJing GuoZhuangZi Line_14)
		(connected GuoZhuangZi DaWaYao Line_14)
		(connected DaWaYao YuanBoYuan Line_14)
		(connected YuanBoYuan ZhangGuoZhuang Line_14)
		(connected feng_bo shun_yi Line_15)
		(connected shun_yi shi_men Line_15)
		(connected shi_men nan_fa_xin Line_15)
		(connected nan_fa_xin hou_sha_yu Line_15)
		(connected hou_sha_yu hua_li_kan Line_15)
		(connected hua_li_kan guo_zhan Line_15)
		(connected guo_zhan sun_he Line_15)
		(connected sun_he ma_quan_ying Line_15)
		(connected ma_quan_ying cui_ge_zhuang Line_15)
		(connected cui_ge_zhuang wang_jing_dong Line_15)
		(connected wang_jing_dong WangJing Line_15)
		(connected WangJing wang_jing_xi Line_15)
		(connected wang_jing_xi guan_zhuang Line_15)
		(connected guan_zhuang da_tun_lu_dong Line_15)
		(connected da_tun_lu_dong an_li_lu Line_15)
		(connected an_li_lu ao_lin_pi_ke_gong_yuan Line_15)
		(connected ao_lin_pi_ke_gong_yuan bei_sha_tan Line_15)
		(connected bei_sha_tan LiuDaoKou Line_15)
		(connected LiuDaoKou qing_hua_dong_lu_xi_kou Line_15)
		(connected bei_an_he wen_yang_lu Line_16)
		(connected wen_yang_lu dao_xiang_hu_lu Line_16)
		(connected dao_xiang_hu_lu tun_dian Line_16)
		(connected tun_dian yong_feng Line_16)
		(connected yong_feng yong_feng_nan Line_16)
		(connected yong_feng_nan xi_bei_wang Line_16)
		(connected xi_bei_wang ma_lian_wa Line_16)
		(connected ma_lian_wa nong_da_nan_lu Line_16)
		(connected nong_da_nan_lu xi_yuan Line_16)
		(connected xi_yuan WanQuanHe_Qiao Line_16)
		(connected WanQuanHe_Qiao SuZhou_Jie Line_16)
		(connected SuZhou_Jie SuZhou_Qiao Line_16)
		(connected SuZhou_Qiao WanShouSi Line_16)
		(connected WanShouSi GuoJia_TuShuGuan Line_16)
		(connected GuoJia_TuShuGuan ErLiGou Line_16)
		(connected ErLiGou GanJiaKou Line_16)
		(connected GanJiaKou YuYuanTan_DongMen Line_16)
		(connected YuYuanTan_DongMen MuXiDi Line_16)
		(connected MuXiDi DaGuanYing Line_16)
		(connected DaGuanYing HongLian_NanLu Line_16)
		(connected HongLian_NanLu LiZe_ShangWu_Qu Line_16)
		(connected LiZe_ShangWu_Qu DongGuanTou_Nan Line_16)
		(connected DongGuanTou_Nan FengTai_Zhan Line_16)
		(connected FengTai_Zhan FengTai_NanLu Line_16)
		(connected FengTai_NanLu FuFeng_Qiao Line_16)
		(connected FuFeng_Qiao KanDan Line_16)
		(connected KanDan YuShuZhuang Line_16)
		(connected YuShuZhuang HongTaiZhuang Line_16)
		(connected HongTaiZhuang WanPingCheng Line_16)
		(connected ShiLiHe ZhouJiaZhuang Line_17)
		(connected ZhouJiaZhuang ShiBaLiDian Line_17)
		(connected ShiBaLiDian BeiShenShu Line_17)
		(connected BeiShenShu CiQu_Bei Line_17)
		(connected CiQu_Bei CiQu Line_17)
		(connected CiQu JiaHuiHu Line_17)
		(connected WeiLai_KeXue_ChengBei WeiLai_KeXueCheng Line_17_North)
		(connected WeiLai_KeXueCheng TianTong_YuanDong Line_17_North)
		(connected TianTong_YuanDong QingHeYing Line_17_North)
		(connected QingHeYing HongJunYing Line_17_North)
		(connected HongJunYing TaiYangGong Line_17_North)
		(connected TaiYangGong XiBaHe Line_17_North)
		(connected XiBaHe ZuoJiaZhuang Line_17_North)
		(connected ZuoJiaZhuang GongRen_TiYuChang Line_17_North)
		(connected XinGong XinFaDi Line_19)
		(connected XinFaDi CaoQiao Line_19)
		(connected CaoQiao JingFengMen Line_19)
		(connected JingFengMen NiuJie Line_19)
		(connected NiuJie TaiPingQiao Line_19)
		(connected TaiPingQiao PingAnLi Line_19)
		(connected PingAnLi JiShuiTan Line_19)
		(connected JiShuiTan BeiTaiPingZhuang Line_19)
		(connected BeiTaiPingZhuang MuDanYuan Line_19)
		(connected chang_ping_xi_shan_kou shi_san_ling_jing_qu Changping_Line)
		(connected shi_san_ling_jing_qu chang_ping Changping_Line)
		(connected chang_ping chang_ping_dong_guan Changping_Line)
		(connected chang_ping_dong_guan bei_shao_wa Changping_Line)
		(connected bei_shao_wa nan_shao Changping_Line)
		(connected nan_shao sha_he_gao_jiao_yuan Changping_Line)
		(connected sha_he_gao_jiao_yuan sha_he Changping_Line)
		(connected sha_he gong_hua_cheng Changping_Line)
		(connected gong_hua_cheng zhu_xin_zhuang Changping_Line)
		(connected zhu_xin_zhuang sheng_ming_ke_xue_yuan Changping_Line)
		(connected sheng_ming_ke_xue_yuan XiErQi Changping_Line)
		(connected XiErQi QingHe_Zhan Changping_Line)
		(connected QingHe_Zhan ZhuFang_Bei Changping_Line)
		(connected ZhuFang_Bei QingHe_XiaoYing_Qiao Changping_Line)
		(connected QingHe_XiaoYing_Qiao XueZhiYuan Changping_Line)
		(connected XueZhiYuan LiuDaoKou Changping_Line)
		(connected LiuDaoKou XueYuan_Qiao Changping_Line)
		(connected XueYuan_Qiao XiTuCheng Changping_Line)
		(connected XiTuCheng JiMen_Qiao Changping_Line)
		(connected CaoQiao DaXing_XinCheng Daxing_Airport_Express)
		(connected DaXing_XinCheng DaXing_JiChang Daxing_Airport_Express)
		(connected yan_cun_dong su_zhuang Fangshan_Line)
		(connected su_zhuang liang_xiang_nan_guan Fangshan_Line)
		(connected liang_xiang_nan_guan liang_xiang_da_xue_cheng_xi Fangshan_Line)
		(connected liang_xiang_da_xue_cheng_xi liang_xiang_da_xue_cheng Fangshan_Line)
		(connected liang_xiang_da_xue_cheng liang_xiang_da_xue_cheng_bei Fangshan_Line)
		(connected liang_xiang_da_xue_cheng_bei guang_yang_cheng Fangshan_Line)
		(connected guang_yang_cheng li_ba_fang Fangshan_Line)
		(connected li_ba_fang chang_yang Fangshan_Line)
		(connected chang_yang dao_tian Fangshan_Line)
		(connected dao_tian DaBaoTai Fangshan_Line)
		(connected DaBaoTai GuoGongZhuang Fangshan_Line)
		(connected GuoGongZhuang BaiPen_Yao Fangshan_Line)
		(connected BaiPen_Yao HuaXiang_DongQiao Fangshan_Line)
		(connected HuaXiang_DongQiao ShouJingMao Fangshan_Line)
		(connected ShouJingMao DongGuanTou_Nan Fangshan_Line)
		(connected Three_Hao_HangZhanLou Two_Hao_HangZhanLou Capital_Airport_Express)
		(connected Two_Hao_HangZhanLou SanYuan_Qiao Capital_Airport_Express)
		(connected SanYuan_Qiao dong_zhi_men Capital_Airport_Express)
		(connected dong_zhi_men BeiXinQiao Capital_Airport_Express)
		(connected BaGou yi_he_yuan_xi_men Xijiao_Line)
		(connected yi_he_yuan_xi_men cha_peng Xijiao_Line)
		(connected cha_peng wan_an Xijiao_Line)
		(connected wan_an GuoJia_ZhiWuYuan Xijiao_Line)
		(connected GuoJia_ZhiWuYuan xiang_shan Xijiao_Line)
		(connected yan_cun_dong zi_cao_wu Yanfang_Line)
		(connected zi_cao_wu yan_cun Yanfang_Line)
		(connected yan_cun xing_cheng Yanfang_Line)
		(connected xing_cheng da_shi_he_dong Yanfang_Line)
		(connected da_shi_he_dong ma_ge_zhuang Yanfang_Line)
		(connected ma_ge_zhuang rao_le_fu Yanfang_Line)
		(connected rao_le_fu fang_shan_cheng_guan Yanfang_Line)
		(connected fang_shan_cheng_guan yan_shan Yanfang_Line)
		(connected song_jia_zhuang xiao_cun Yizhuang_Line)
		(connected xiao_cun xiao_hong_men Yizhuang_Line)
		(connected xiao_hong_men jiu_gong Yizhuang_Line)
		(connected jiu_gong yi_zhuang_qiao Yizhuang_Line)
		(connected yi_zhuang_qiao yi_zhuang_wen_hua_yuan Yizhuang_Line)
		(connected yi_zhuang_wen_hua_yuan wan_yuan_jie Yizhuang_Line)
		(connected wan_yuan_jie rong_jing_dong_jie Yizhuang_Line)
		(connected rong_jing_dong_jie rong_chang_dong_jie Yizhuang_Line)
		(connected rong_chang_dong_jie tong_ji_nan_lu Yizhuang_Line)
		(connected tong_ji_nan_lu jing_hai_lu Yizhuang_Line)
		(connected jing_hai_lu ci_qu_nan Yizhuang_Line)
		(connected ci_qu_nan CiQu Yizhuang_Line)
		(connected CiQu yi_zhuang_huo_che_zhan Yizhuang_Line)

    )

    (:goal (and
        (at passenger0 feng_bo)
        )
    )
)