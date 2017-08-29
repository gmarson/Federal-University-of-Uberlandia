.class public Lmicro01;
.super Ljava/lang/Object;
.source "micro01.java"


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
    .registers 9

    .prologue
    .line 7
    move-object v0, p0

    new-instance v4, Ljava/util/Scanner;

    move-object v7, v4

    move-object v4, v7

    move-object v5, v7

    sget-object v6, Ljava/lang/System;->in:Ljava/io/InputStream;

    invoke-direct {v5, v6}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    move-object v1, v4

    .line 9
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "\t\tTabela de conversao: Celsius -> Fahrenheit"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 10
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Digite a temperatura em Celsius: "

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 11
    move-object v4, v1

    invoke-virtual {v4}, Ljava/util/Scanner;->nextFloat()F

    move-result v4

    move v2, v4

    .line 12
    const/high16 v4, 0x41100000    # 9.0f

    move v5, v2

    mul-float/2addr v4, v5

    const/high16 v5, 0x43200000    # 160.0f

    add-float/2addr v4, v5

    const/high16 v5, 0x40a00000    # 5.0f

    div-float/2addr v4, v5

    move v3, v4

    .line 13
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuffer;

    move-object v7, v5

    move-object v5, v7

    move-object v6, v7

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "A nova temperatura \u00e9:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    move v6, v3

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(F)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "F"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 14
    return-void
.end method
