
CREATE TABLE "usuario" (
    "usu_id" SERIAL PRIMARY KEY, 
    "usu_email" VARCHAR(255) UNIQUE NOT NULL,
    "usu_senha" VARCHAR(255) NOT NULL
);

CREATE TABLE "conversa" (
    "conv_id" SERIAL PRIMARY KEY,
    "conv_desc" TEXT NOT NULL,      
    "conv_data" TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    "conv_usu_id" INT REFERENCES "usuario"("usu_id") ON DELETE CASCADE
);

CREATE TABLE "mensagem" (
    "msg_id" SERIAL PRIMARY KEY,             
    "msg_texto" TEXT NOT NULL,
    "msg_remetente" VARCHAR(6) CHECK ("msg_remetente" IN ('chat', 'user')) NOT NULL, 
    "msg_data" TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    "msg_conv_id" INT REFERENCES "conversa"("conv_id") ON DELETE CASCADE 
);