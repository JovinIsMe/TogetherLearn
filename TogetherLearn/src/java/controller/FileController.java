package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

public class FileController {
    public static void copyFile(File source, File dest) throws IOException {
        Files.copy(source.toPath(), dest.toPath());
    }
}
