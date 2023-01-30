package co.wardcorp.catchtable.openapi_generator_demo;

import co.wardcorp.catchtable.api.HealthcheckApi;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

@Controller
public class HealthCheckController implements HealthcheckApi {
    @Override
    public ResponseEntity<String> ticHealthCheck() {
        return ResponseEntity.ok("ok");
    }
}
