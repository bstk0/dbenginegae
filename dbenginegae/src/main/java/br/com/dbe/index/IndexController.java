package br.com.dbe.index;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class IndexController {

	private final Result result;

	public IndexController(Result result) {
		this.result = result;
	}

	@Path("/index/index")
	public void index() {
		result.include("variable", "Z - VRaptor GAE DBEngine !");
	}
	
	@Path("/zabc")
	public void other() {
		result.redirectTo(IndexController.class).index();
	}
	
	public void log() {
	}

}
