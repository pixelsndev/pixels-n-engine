#include <SDL2/SDL.h>
#include <iostream>

int main(int argc, char* argv[]) {
    // Inicializar SDL
    if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        std::cerr << "SDL_Init Error: " << SDL_GetError() << std::endl;
        return 1;
    }

    // Crear una ventana
    SDL_Window *win = SDL_CreateWindow("Hello SDL2", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 640, 480, SDL_WINDOW_SHOWN);
    if (win == nullptr) {
        std::cerr << "SDL_CreateWindow Error: " << SDL_GetError() << std::endl;
        SDL_Quit();
        return 1;
    }

    // Bucle principal
    bool running = true;
    SDL_Event event;
    while (running) {
        // Manejar eventos
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                running = false;
            }
        }

        // Aquí podrías agregar lógica de actualización y renderizado

        // Espera un poco para no consumir CPU innecesariamente
        SDL_Delay(16); // Aproximadamente 60 FPS
    }

    // Limpiar y salir
    SDL_DestroyWindow(win);
    SDL_Quit();
    return 0;
}