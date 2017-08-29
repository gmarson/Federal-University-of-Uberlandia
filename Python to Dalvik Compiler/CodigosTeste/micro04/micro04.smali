.class public Lmicro04;
.super Ljava/lang/Object;
.source "micro04.java"


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 3
    move-object v0, p0

    move-object v1, v0

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 10

    .prologue
    .line 7
    move-object v0, p0

    new-instance v5, Ljava/util/Scanner;

    move-object v8, v5

    move-object v5, v8

    move-object v6, v8

    sget-object v7, Ljava/lang/System;->in:Ljava/io/InputStream;

    invoke-direct {v6, v7}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    move-object v1, v5

    .line 8
    const/4 v5, 0x0

    move v2, v5

    const/4 v5, 0x0

    move v3, v5

    const/4 v5, 0x0

    move v4, v5

    .line 10
    const/4 v5, 0x0

    move v2, v5

    :goto_14
    move v5, v2

    const/4 v6, 0x5

    if-ge v5, v6, :cond_37

    .line 11
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v6, "Digite o numero: "

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 12
    move-object v5, v1

    invoke-virtual {v5}, Ljava/util/Scanner;->nextInt()I

    move-result v5

    move v3, v5

    .line 13
    move v5, v3

    const/16 v6, 0xa

    if-lt v5, v6, :cond_34

    .line 14
    move v5, v3

    const/16 v6, 0x96

    if-gt v5, v6, :cond_34

    .line 15
    move v5, v4

    const/4 v6, 0x1

    add-int/lit8 v5, v5, 0x1

    move v4, v5

    .line 10
    :cond_34
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 18
    :cond_37
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuffer;

    move-object v8, v6

    move-object v6, v8

    move-object v7, v8

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Ao total, foram digitados "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    move v7, v4

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " numeros no intervalo entre 10 e 150"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 19
    return-void
.end method
