template <typename T>
int load_file(const char *file_name,
              T *buffer) {
    std::ifstream file(file_name);
    int i = 0;
    if (file.good()) {
        float item = 0;
        while(file >> item) {
            buffer[i] = (T) item;
            i++;
        }
        file.close();
        return 0;
    }
    return 1;
}
