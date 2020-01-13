package _global.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
	// getRootConfigClasses()會傳回提供組態資訊(Java based configuration)的Java類別，
	// 本例為RootAppConfig類別，它說明應用系統中，提供Service/Dao功能之Bean的組態資訊，例如提供
	// DataSource類別、交易管理器(Transaction managers)、Hibernate的SessionFactory類別等。
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] {RootAppConfig.class};
	}
	// WebAppConfig類別說明本應用系統的組態資訊，如通知分派器要到那些資料夾去找視圖檔、告訴Spring MVC
    // 那些套件下有控制器類別等受Spring控管的類別、檔案上傳時會用到的類別、哪些路徑下有靜態檔案，這些靜態
    // 檔案直接由容器傳回給客戶端而不要交給控制器去處理等等。
	@Override
	protected Class<?>[] getServletConfigClasses() {	// 取代Spring的組態檔
		return new Class[] {WebAppConfig.class};
	}
	// 定義DispatcherServlet的ServletMapping，"/"表示分派器要處理所有請求。
	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}
	
	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		characterEncodingFilter.setForceEncoding(true);
		HiddenHttpMethodFilter hiddenHttpMethodFilter=new HiddenHttpMethodFilter();
		return new Filter[] {characterEncodingFilter,hiddenHttpMethodFilter};
	}
}
