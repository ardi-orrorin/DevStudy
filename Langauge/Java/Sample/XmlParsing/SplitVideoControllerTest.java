package kr.co.stabis.videomanager.web.split;

import kr.co.stabis.videomanager.model.split.SplitRequest;
import kr.co.stabis.videomanager.security.SecurityConfig;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.SpyBean;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.MediaType;
import org.springframework.http.client.MultipartBodyBuilder;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.reactive.server.EntityExchangeResult;
import org.springframework.test.web.reactive.server.WebTestClient;
import org.springframework.util.MultiValueMap;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@ActiveProfiles("local")
class SplitVideoControllerTest {

    @LocalServerPort
    private int port;

    private WebTestClient webTestClient;

    private Logger log = LoggerFactory.getLogger(SplitVideoControllerTest.class);

    @BeforeEach
    void setUp() {
        webTestClient = WebTestClient.bindToServer()
                .baseUrl("http://localhost:" + port)
                .build();
    }

    @Test
    void testGenerateClip() {
        MultipartBodyBuilder builder = new MultipartBodyBuilder();
        builder.part("file", new FileSystemResource("d:\\xml\\msg_20231014-034-00.xml"));

        MultiValueMap<String, HttpEntity<?>> parts = builder.build();

        EntityExchangeResult result = webTestClient.post()
                .uri("/splits/clip")
                .contentType(MediaType.MULTIPART_FORM_DATA)
                .bodyValue(parts)
                .exchange()
                .expectStatus().isOk()
                .expectBody()
                .returnResult();

        result.getResponseBody();
    }

    @Test
    void generateClip() {

        List<SplitRequest.ClipVideoMetadata.Entry> list = new ArrayList<>();

        for(int i = 0; i < 10; i++){
            SplitRequest.ClipVideoMetadata.Entry entry = new SplitRequest.ClipVideoMetadata.Entry();
            entry.setInnSeq("1");
            entry.setPitchSeq("1");
            entry.setStartTime("00:07:04");
            entry.setDuration("00:00:07");
            list.add(entry);
        }

        SplitRequest.ClipVideoMetadata clipMetadata = new SplitRequest.ClipVideoMetadata();
        clipMetadata.setOrgFileName("https://video.stabis.co.kr/full_ach/2023/10/14/1-10-2023-10-14-035-09-2.mp4");
        clipMetadata.setFlag("S");
        clipMetadata.setEntrys(list);

        EntityExchangeResult result = webTestClient.post()
                .uri("/splits/clip")
                .bodyValue(clipMetadata)
                .exchange()
                .expectStatus().isOk()
                .expectBody()
                .returnResult();

        result.getResponseBody();
    }
}