package kr.co.stabis.videomanager.util;

import kr.co.stabis.videomanager.model.split.SplitRequest;
import kr.co.stabis.videomanager.web.excepnHandler.NotFileProcessingException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.File;
import java.io.IOException;

@Slf4j
public class XmlProvider {

    @Value("${metadata.file.dir}")
    private String META_DIR;

    public boolean xmlWriter(SplitRequest.ClipVideoMetadata metadata) {
        metadata.validate();
        File file = new File("");
        File dummyFile = new File("");
        String[] info = metadata.getOrgFileName()
                .substring(metadata.getOrgFileName().lastIndexOf("/") + 1)
                .split("-");
        try {
            Document doc = DocumentBuilderFactory.newInstance()
                    .newDocumentBuilder().newDocument();

            Transformer transformer = TransformerFactory
                    .newDefaultInstance().newTransformer();

            //[1-S] xml 문서 초기화
            doc.setXmlStandalone(true);
            transformer.setOutputProperty("encoding", "EUC-KR"); // utf-8 ?
            transformer.setOutputProperty("indent", "yes"); // 들여쓰기
            transformer.setOutputProperty("doctype-public", "yes");
            //[1-E]

            //[2-S] xml ArticleList Tag 생성
            Element root = doc.createElement("ArticleList");
            String date = info[2] + "-" + info[3] + "-" + info[4]; // 2023-10-14
            root.setAttribute("Createdate", date);
            root.setAttribute("org", metadata.getOrgFileName());
            //[2-E]

            //[3-S] xml Entry Tag 생성
            String gKeyPrefix = info[0] // 1,20231014,035,09,2;
                    + "," + info[2] + info[3] + info[4]
                    + "," + info[1]
                    + "," + info[5]
                    + "," + info[6];

            for (SplitRequest.ClipVideoMetadata.Entry entry : metadata.getEntrys()) {
                String gKey = gKeyPrefix // 1,20231014,035,09,2,1,1
                        + "," + entry.getInnSeq()
                        + "," + entry.getPitchSeq();

                Element e = entryWriter(
                        doc,
                        gKey,
                        entry.getStartTime(),
                        entry.getDuration(),
                        metadata.getFlag().toUpperCase()
                );
                root.appendChild(e);
            }
            doc.appendChild(root);
            //[3-E]

            //[4-S] xml 파일 생성
            Source source = new DOMSource(doc);

            String subDir = ""; // 하위 경로
            String path = META_DIR + subDir;

            file = save(gKeyPrefix, path);

            StreamResult result = new StreamResult(file);
            transformer.transform(source, result);
            //[4-E]

            //[5-S] 비디오 변환 스위치 역할을 하는 더미 파일 생성
            dummyFile = dummyFileWriter(path, metadata);
            //[5-E]

            return true;
        } catch (TransformerException | ParserConfigurationException | NotFileProcessingException e) {
            deleteFiles(file, dummyFile);
            throw new NotFileProcessingException(e.getMessage());
        }
    }

    private Element entryWriter(Document doc,
                                String gKeyVal,
                                String startTimeVal,
                                String durationVal,
                                String flagVal
    ) {
        Element entry = doc.createElement("ENTRY");

        Element gKey = doc.createElement("GKEY");
        gKey.setTextContent(gKeyVal);

        Element startTime = doc.createElement("STARTTIME");
        startTime.setTextContent(startTimeVal);

        Element duration = doc.createElement("DURATION");
        duration.setTextContent(durationVal);

        Element flag = doc.createElement("FLAG");
        flag.setTextContent(flagVal);

        entry.appendChild(gKey);
        entry.appendChild(startTime);
        entry.appendChild(duration);
        entry.appendChild(flag);

        return entry;
    }

    private File save(String gKeyPrefix, String path) {
        if(!new File(path).exists()){
            new File(path).mkdirs();
        }
        return duplicateConfirm(path, gKeyPrefix);
    }

    private File duplicateConfirm(String path,
                                  String gKeyPrefix
    ) {
        String[] splitGKey = gKeyPrefix.split(",");
        String gPlace = splitGKey[3];
        String date = splitGKey[1];
        String prefix = "msg_";
        String ext = ".xml";
        String filename = "";

        int count = 0;
        while(true) {
            String seq = String.format("%02d", count);
            filename = path + prefix + date + "-" + gPlace + "-" + seq  + ext;
            if(!new File(filename).exists()) break;
            count++;
            if(count > 99) {
                throw new NotFileProcessingException("Unable to create file name.");
            }
        }

        return new File(filename);
    }

    private void deleteFiles(File file, File... files) {
        if(file != null) {
            file.delete();
        }
        if(files != null && files.length > 0) {
            for (File f : files) {
                if(f != null && f.exists()) {
                    f.delete();
                }
            }
        }
    }

    public File dummyFileWriter(String path, SplitRequest.ClipVideoMetadata metadata) {
        String videoFile = metadata.getOrgFileName().substring(
                metadata.getOrgFileName().lastIndexOf("/") + 1
        );

        String dummyFilename = videoFile + ".inn";
        File dummyFile = new File(path, dummyFilename);

        if(dummyFile.exists()) throw new NotFileProcessingException("The dummy file already exists.");
        try {
            dummyFile.createNewFile();
            return dummyFile;
        } catch (IOException e) {
            throw new NotFileProcessingException("An error occurred while creating the dummy file.");
        }
    }

}
