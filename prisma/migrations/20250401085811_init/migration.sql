/*
  Warnings:

  - You are about to drop the column `createdAt` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `User` table. All the data in the column will be lost.
  - Made the column `title` on table `ToDo` required. This step will fail if there are existing NULL values in that column.
  - Made the column `completed` on table `ToDo` required. This step will fail if there are existing NULL values in that column.
  - Made the column `userId` on table `ToDo` required. This step will fail if there are existing NULL values in that column.
  - Made the column `email` on table `User` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "ToDo" DROP CONSTRAINT "ToDo_userId_fkey";

-- AlterTable
ALTER TABLE "ToDo" ALTER COLUMN "title" SET NOT NULL,
ALTER COLUMN "completed" SET NOT NULL,
ALTER COLUMN "userId" SET NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "SubsciptionEnds" TIMESTAMP(3),
ADD COLUMN     "isSubscribed" BOOLEAN NOT NULL DEFAULT false,
ALTER COLUMN "email" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "ToDo" ADD CONSTRAINT "ToDo_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
